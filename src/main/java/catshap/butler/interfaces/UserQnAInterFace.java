package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.UserQnA;


public interface UserQnAInterFace {
	public abstract List<UserQnA> selectUserQnAList(int userNo) throws Exception;
}
