package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.Main;

public interface MainInterface {
	
	public abstract List<Main> selectMain() throws Exception;
	
}