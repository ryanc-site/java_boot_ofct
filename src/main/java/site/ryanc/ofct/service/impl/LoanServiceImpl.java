package site.ryanc.ofct.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.ryanc.ofct.mapper.LoanMapper;
import site.ryanc.ofct.mapper.P_customerMapper;
import site.ryanc.ofct.model.LoanInfo;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.service.LoanService;
import site.ryanc.ofct.service.P_customerService;

import javax.annotation.Resource;
import java.util.Map;

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
public class LoanServiceImpl extends BaseServiceImpl<LoanInfo,String> implements LoanService {

    @Resource
    private LoanMapper loanMapper;

    @Override
    public PageInfo<LoanInfo> selectByKeyWord(Map<String, Object> paraMap) {
        Integer pageNum = (Integer) paraMap.get("page");
        Integer pageSize = (Integer) paraMap.get("limit");
        String keyWord = (String) paraMap.get("keyword");
        String csr_type = (String) paraMap.get("csr_type");
        pageNum = pageNum > 0 ? pageNum : defaultPageNum;
        pageSize = pageSize > 0 ? pageSize : defaultPageSize;
        PageHelper.startPage(pageNum, pageSize);
        return new PageInfo(loanMapper.selectByKeyWord(keyWord,csr_type));
    }

}
