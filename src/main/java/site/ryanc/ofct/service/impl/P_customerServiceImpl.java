package site.ryanc.ofct.service.impl;

import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.ryanc.ofct.mapper.P_customerMapper;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.service.BaseService;
import site.ryanc.ofct.service.P_customerService;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static cn.hutool.json.XMLTokener.entity;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 个人客户 - serviceImpl
 * @createTime 2021年09月12日 08:40:00
 */
@Service
public class P_customerServiceImpl extends BaseServiceImpl<PersonCustomer,String> implements P_customerService {

    @Resource
    private P_customerMapper p_customerMapper;

    @Override
    public PageInfo<PersonCustomer> selectByKeyWord(Map<String, Object> paraMap) {
        Integer pageNum = (Integer) paraMap.get("page");
        Integer pageSize = (Integer) paraMap.get("limit");
        String keyWord = (String) paraMap.get("keyword");
        String starTime = (String) paraMap.get("starTime");
        String endTime = (String) paraMap.get("endTime");
        pageNum = pageNum > 0 ? pageNum : defaultPageNum;
        pageSize = pageSize > 0 ? pageSize : defaultPageSize;
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(p_customerMapper.selectByKeyWord(keyWord,starTime,endTime));
    }

    @Override
    public PersonCustomer getByCsrName(String csr_name) {
        return p_customerMapper.selectByCsrName(csr_name);
    }

}
