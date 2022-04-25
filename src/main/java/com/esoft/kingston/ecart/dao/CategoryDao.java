package com.esoft.kingston.ecart.dao;

import java.util.List;

import com.esoft.kingston.ecart.domain.ProductCategory;
import com.esoft.kingston.ecart.util.UserConfig;

public interface CategoryDao {
	public void createCategory(UserConfig userConfig, ProductCategory category)throws Exception;
	public void updateCategory(UserConfig userConfig, ProductCategory category)throws Exception;
	public void deleteCategory(UserConfig userConfig, int id)throws Exception;
	public List<ProductCategory> getAllUser(UserConfig userSession);
}
