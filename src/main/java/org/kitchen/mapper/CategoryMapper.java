package org.kitchen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface CategoryMapper {
	
	
	//---select-----
	public String getCategoryNameByCode(int code); 
	
	
	public List<Integer> getMCByLC(int code);
	public int getLCbyMC(int code);
	
	//--insert---
	public void insertCategory(@Param("c_code") int c_code, @Param("CategoryName") String CategoryName,@Param("c_prev_code") int c_prev_code);
	
	//--delete---
	public void deleteCategory(int code);

	
	//--update--
	public void updateCategory(@Param("c_code") int c_code, @Param("CategoryName") String CategoryName, @Param("c_prev_code") int c_prev_code);
	
	
	
//	public void insert(ContentVO content);
}