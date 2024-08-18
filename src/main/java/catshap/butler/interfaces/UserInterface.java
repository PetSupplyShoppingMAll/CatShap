package catshap.butler.interfaces;

import java.sql.SQLException;

import catshap.butler.bean.Grade;
import catshap.butler.bean.UserAuthcode;
import catshap.butler.bean.Users;

public interface UserInterface {

	public abstract Users getUser(Users user) throws SQLException; // 사용자 조회 - 로그인

	public abstract String getUserId(Users user) throws SQLException; // 사용자 조회 - 아이디 찾기

	public abstract String getUserPw(Users user) throws SQLException; // 사용자 조회 - 비밀번호 찾기

	public abstract int updateUserPw(Users user) throws SQLException; // 비밀번호 업데이트

	public abstract int insertUserAuthcode(UserAuthcode userAuthcode); // 비밀번호 찾기 인증코드 추가

	public abstract UserAuthcode getUserAuthcode(String usid); // 인증코드 식별

	public abstract int updateUserAuthcode(UserAuthcode userAuthcode); // 인증코드 재발행

	public abstract int registUser(Users user) throws SQLException; // 회원 가입

	public abstract boolean isUsidTaken(String usid) throws SQLException; // 아이디 중복검사

	public abstract boolean isUnickTaken(String unick) throws SQLException; // 닉네임 중복검사

	public abstract int updateUser(Users user) throws SQLException; // 회원정보 업데이트

	public abstract int updateExitUserStatus(Users user) throws SQLException; // 탈퇴 사용자 본인 확인

	public abstract Grade getUserGrade(int userNo) throws SQLException; // 유저 등급

}
