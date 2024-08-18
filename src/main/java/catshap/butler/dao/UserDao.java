package catshap.butler.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Random;

import javax.mail.MessagingException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Grade;
import catshap.butler.bean.UserAuthcode;
import catshap.butler.bean.Users;
import catshap.butler.interfaces.UserInterface;
import catshap.butler.util.EmailUtil;

public class UserDao implements UserInterface {

    private static Reader reader;
    private static SqlSessionFactory ssf;

    static {
        try {
            reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
            ssf = new SqlSessionFactoryBuilder().build(reader);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private SqlSession openSession() {
        return ssf.openSession();
    }

    @Override
    public Users getUser(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            return ss.selectOne("user.getUser", user);
        }
    }

    @Override
    public String getUserId(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            return ss.selectOne("user.getUserId", user);
        }
    }

    @Override
    public String getUserPw(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            Users getUser = ss.selectOne("user.getUserPw", user);
            if (getUser != null) {
                String authCode = generateAuthCode();
                sendAuthcodeEmail(getUser, authCode);
                setUserAuthcode(getUser, authCode);
                return getUser.getUpass();
            }
            return null;
        }
    }

    @Override
    public int updateUserPw(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            int result = ss.update("user.updateUserPw", user);
            ss.commit();
            return result;
        }
    }

    @Override
    public int insertUserAuthcode(UserAuthcode userAuthcode) {
        try (SqlSession ss = openSession()) {
            int result = ss.insert("userauthcode.insertUserAuthcode", userAuthcode);
            ss.commit();
            return result;
        }
    }

    @Override
    public UserAuthcode getUserAuthcode(String usid) {
        try (SqlSession ss = openSession()) {
            return ss.selectOne("userauthcode.getUserAuthcode", usid);
        }
    }

    @Override
    public int updateUserAuthcode(UserAuthcode userAuthcode) {
        try (SqlSession ss = openSession()) {
            int result = ss.update("userauthcode.updateUserAuthcode", userAuthcode);
            ss.commit();
            return result;
        }
    }

    private void sendAuthcodeEmail(Users user, String authCode) {
        String subject = "귀하의 인증 코드";
        String message = String.format("%s님,\n\n" +
                "귀하의 이메일 주소를 통해 계정 %s에 대한 액세스가 요청되었습니다. " +
                "인증 코드는 다음과 같습니다.\n\n%s\n\n" +
                "이 코드를 요청하지 않았다면 다른 사람이 계정 %s에 액세스하려고 시도하는 것일 수 있습니다. " +
                "누구에게도 이 코드를 전달하거나 제공하면 안됩니다.\n\n" +
                "감사합니다.\n\nCatshap 계정팀", user.getUname(), user.getEmail(), authCode, user.getEmail());

        try {
            EmailUtil.sendEmail(user.getEmail(), subject, message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private String generateAuthCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    private void setUserAuthcode(Users user, String authCode) {
        UserAuthcode existingAuthcode = getUserAuthcode(user.getUsid());
        UserAuthcode userAuthcode = new UserAuthcode(user.getUserNo(), user.getUsid(), authCode, new Timestamp(System.currentTimeMillis()));

        if (existingAuthcode != null) {
            updateUserAuthcode(userAuthcode);
        } else {
            insertUserAuthcode(userAuthcode);
        }
    }

    @Override
    public int registUser(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            int result = ss.insert("user.registUser", user);
            ss.commit();
            return result;
        }
    }

    @Override
    public boolean isUsidTaken(String usid) throws SQLException {
        try (SqlSession ss = openSession()) {
            Integer count = ss.selectOne("user.isUsidTaken", usid);
            return count != null && count > 0;
        }
    }

    @Override
    public boolean isUnickTaken(String unick) throws SQLException {
        try (SqlSession ss = openSession()) {
            Integer count = ss.selectOne("user.isUnickTaken", unick);
            return count != null && count > 0;
        }
    }

    @Override
    public int updateUser(Users user) throws SQLException {
        try (SqlSession ss = openSession()) {
            int result = ss.update("user.updateUser", user);
            ss.commit();
            return result;
        }
    }

	@Override
	public int updateExitUserStatus(Users user) throws SQLException {
		SqlSession ss = ssf.openSession();
		int result = ss.insert("user.updateExitUserStatus", user);
		ss.commit();
		ss.close();
		return result;
	}
	
	@Override
	public Grade getUserGrade(int userNo) throws SQLException {
	    try (SqlSession ss = openSession()) {
	        return ss.selectOne("usergrade.getUserGrade", userNo);
	    }
	}

}
