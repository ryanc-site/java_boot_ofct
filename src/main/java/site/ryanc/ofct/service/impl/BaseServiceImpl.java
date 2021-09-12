package site.ryanc.ofct.service.impl;

import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import site.ryanc.ofct.common.util.IDUtil;
import site.ryanc.ofct.mapper.common.BaseMapper;
import site.ryanc.ofct.service.BaseService;

import javax.annotation.Resource;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
@Slf4j
@SuppressWarnings({"unchecked"})
public class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T, ID> {

    @Autowired
    protected BaseMapper<T, ID> baseMapper;

    /**
     * 默认当前页
     */
    protected int defaultPageNum = 1;
    /**
     * 默认每页条数
     */
    protected int defaultPageSize = 15;

    @Override
    public int delete(ID id) {
        if (id == null) {
            return 0;
        }
        return baseMapper.delete(id);
    }

    @Override
    public T save(T entity) {
        if (entity == null) {
            return null;
        }
        //id为字符串类型时需要设置默认值，否则认为id是数据库自动生成
        try {
            Class<?> idType = PropertyUtils.getPropertyType(entity, "id");
            if (idType == Long.class && PropertyUtils.getProperty(entity, "id") == null) {
                setPropertyValue(entity, "id", IDUtil.getId());
            }
            if (idType == String.class && PropertyUtils.getProperty(entity, "id") == null) {
                setPropertyValue(entity, "id", String.valueOf(IDUtil.getId()));
            }

            // 判断是否存在创建时间、修改时间两个字段，如果存在就设置值
            PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(entity);
            for (PropertyDescriptor descriptor : propertyDescriptors) {
                if ("createDate".equals(descriptor.getName())) {
                    setPropertyValue(entity, "createDate", new Date());
                } else if ("modifyDate".equals(descriptor.getName())) {
                    setPropertyValue(entity, "modifyDate", new Date());
                } else if ("ctime".equals(descriptor.getName())) {
                    setPropertyValue(entity, "ctime", DateUtil.formatDateTime(new Date()));
                } else if ("utime".equals(descriptor.getName())) {
                    setPropertyValue(entity, "utime", new Date());
                }
            }
        } catch (Exception e) {
            log.info("pojo类：" + entity.getClass() + "无id属性");
        }
        return baseMapper.save(entity) > 0 ? entity : null;
    }

    @Override
    public T update(T entity) {
        if (entity == null) {
            return null;
        }
        // 判断是否存在修改时间字段，如果存在就更新为当前值
        PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(entity);
        for (PropertyDescriptor descriptor : propertyDescriptors) {
            if ("modifyDate".equals(descriptor.getName())) {
                setPropertyValue(entity, "modifyDate", new Date());
            } else if ("utime".equals(descriptor.getName())) {
                setPropertyValue(entity, "utime", new Date());
            }
        }
        return baseMapper.update(entity) > 0 ? entity : null;
    }

    @Override
    public T getById(ID id) {
        if (id == null) {
            return null;
        }
        return baseMapper.getById(id);
    }

    @Override
    public PageInfo<T> selectList(T entity, int pageNum, int pageSize) {
        pageNum = pageNum > 0 ? pageNum : defaultPageNum;
        pageSize = pageSize > 0 ? pageSize : defaultPageSize;
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(baseMapper.selectList(entity));
    }

    @Override
    public List<T> selectList(T entity) {
        return baseMapper.selectList(entity);
    }

    /**
     * 设置对象的属性值,若属性值为空则进行设置
     *
     * @param entity
     * @param property
     * @param value
     */
    protected void setPropertyValue(T entity, String property, Object value) {
        setPropertyValue(entity, property, value, false);
    }

    /**
     * 设置对象的值
     *
     * @param entity
     * @param property
     * @param value
     * @param isForced 是否强制设置
     */
    protected void setPropertyValue(T entity, String property, Object value, boolean isForced) {
        try {
            Class propertyType = PropertyUtils.getPropertyType(entity, property);

            if (propertyType != value.getClass()) {
                return;
            }
            if (isForced) {
                PropertyUtils.setProperty(entity, property, value);
            } else {
                Object propValue = PropertyUtils.getProperty(entity, property);
                if (propValue == null) {
                    PropertyUtils.setProperty(entity, property, value);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}