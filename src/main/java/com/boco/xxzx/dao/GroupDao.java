package com.boco.xxzx.dao;

import java.util.List;

import com.boco.xxzx.model.Dictionary;
import com.boco.xxzx.model.GroupMenu;
import com.boco.xxzx.model.GroupRole;
/**
 * @author liushaoqing
 * @date 创建时间：2017年10月26日 下午5:03:21
 * @version 1.0
 * @parameter
 * @since
 * @return
 */
public interface GroupDao {
	/**
	 * 
	 * <p>
	 * Title: selectGroup
	 * </p>
	 * <p>
	 * Description: TODO(数据搜索的方法)
	 * </p>
	 * 
	 * @param: @param Group
	 * @param: @return
	 * @return: List<User>
	 *
	 */
	public List<Dictionary> selectGroup(Dictionary group);
	/**
	 * 
	 * <p>
	 * Title: addGroup
	 * </p>
	 * <p>
	 * Description: TODO(数据添加的方法)
	 * </p>
	 * 
	 * @param: @param Group
	 * @param: @return
	 * @return: Integer
	 *
	 */
	//public Integer addGroup(Group group);
	/**
	 * 
	 * <p>
	 * Title: modifyGroup
	 * </p>
	 * <p>
	 * Description: TODO(数据修改的方法)
	 * </p>
	 * 
	 * @param: @param Group
	 * @param: @return
	 * @return: Integer
	 *
	 */
	//public Integer modifyGroup(Group group);
	/**
	 * 
	 * <p>
	 * Title: delGroup
	 * </p>
	 * <p>
	 * Description: TODO(数据删除的方法)
	 * </p>
	 * 
	 * @param: @param Group
	 * @param: @return
	 * @return: Integer
	 *
	 */
	//public Integer delGroup(Integer groupId);
	/**
	 * 
	 * <p>
	 * Title: delGroup
	 * </p>
	 * <p>
	 * Description: TODO(数据删除时删除关联信息)
	 * </p>
	 * 
	 * @param: @param Group
	 * @param: @return
	 * @return: Integer
	 *
	 */
	public Integer delGroupNode(Integer groupId);
	/**
	 * 
	 * <p>
	 * Title: addGroupRole
	 * </p>
	 * <p>
	 * Description: TODO(添加角色组的数据权限)
	 * </p>
	 * 
	 * @param: @param GroupRole
	 * @param: @return
	 * @return: Integer
	 */
	public Integer addGroupRole(GroupRole groupRole);
	/**
	 * 
	 * <p>
	 * Title: deleteGroupRole
	 * </p>
	 * <p>
	 * Description: TODO(删除角色组的数据权限)
	 * </p>
	 * 
	 * @param: @param GroupId
	 * @param: @return
	 * @return: Integer
	 */
	//public Integer deleteGroupRole(Integer groupId);
	/**
	 * 
	 * <p>
	 * Title: selectGroupRoleById
	 * </p>
	 * <p>
	 * Description: TODO(通过Id查询角色组和角色的授权关系)
	 * </p>
	 * 
	 * @param: @param GroupId
	 * @param: @return
	 * @return: List
	 */
	public List<GroupRole> selectGroupRoleById(Integer groupId);
	/**
	 * 
	 * <p>Title: addGroupMenu</p>   
	 * <p>Description: TODO(添加角色组的功能信息)</p>  
	 * @param: @param groupMenu
	 * @param: @return      
	 * Integer  
	 *
	 */
	public Integer addGroupMenu(GroupMenu groupMenu);
	/**
	 * 
	 * <p>
	 * Title: deleteGroupMenu
	 * </p>
	 * <p>
	 * Description: TODO(删除角色组的功能权限)
	 * </p>
	 * 
	 * @param: @param GroupId
	 * @param: @return
	 * @return: Integer
	 */
	public Integer deleteGroupMenu(GroupMenu groupMenu);
	/**
	 * 
	 * <p>Title: selectGroupMenuById</p>   
	 * <p>Description: TODO(按id查询授权信息)</p>  
	 * @param: @param GroupId
	 * @param: @return      
	 * @return:List  
	 *
	 */
	public List<GroupMenu> selectGroupMenuById(Integer groupId);
	/**
	 * 
	 * <p>
	 * Title: deleteGroupRole
	 * </p>
	 * <p>
	 * Description: TODO(删除角色组的功能权限)
	 * </p>
	 * 
	 * @param: @param GroupRole
	 * @param: @return
	 * @return: Integer
	 */
	public Integer deleteGroupRole(GroupRole groupRole);
}
