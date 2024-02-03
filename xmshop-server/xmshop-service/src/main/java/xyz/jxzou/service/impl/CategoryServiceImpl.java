package xyz.jxzou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.jxzou.repository.CategoryRepository;
import xyz.jxzou.service.CategoryService;

/**
 * The type CategoryServiceImpl.
 *
 * @author Jx-zou
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    private CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
}
