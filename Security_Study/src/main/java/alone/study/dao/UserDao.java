package alone.study.dao;

import java.util.ArrayList;

import alone.study.dto.UserDto;

public interface UserDao {
	public void create(UserDto dto) throws Exception;

	public void update(UserDto dto) throws Exception;

	public void delete(String userId) throws Exception;

	public ArrayList<UserDto> userList() throws Exception;

	public UserDto userDetail(String userId) throws Exception;

	public void upgradeuser(UserDto dto) throws Exception;
}
