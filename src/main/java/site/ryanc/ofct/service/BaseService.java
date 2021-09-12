package site.ryanc.ofct.service;

import com.github.pagehelper.PageInfo;

import java.io.Serializable;
import java.util.List;

/**
 * service 基础接口
 */
public interface BaseService<T, ID extends Serializable> extends Serializable {

    int delete(ID id);

    T save(T entity);

    T getById(ID id);

    T update(T entity);

    PageInfo<T> selectList(T entity, int pageNum, int pageSize);

    List<T> selectList(T entity);
}