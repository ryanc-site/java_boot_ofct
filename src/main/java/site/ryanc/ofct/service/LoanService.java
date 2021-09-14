package site.ryanc.ofct.service;

import com.github.pagehelper.PageInfo;
import site.ryanc.ofct.model.LoanInfo;
import site.ryanc.ofct.model.PersonCustomer;

import java.util.Map;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 个人客户 - service
 * @createTime 2021年09月12日 08:39:00
 */
public interface LoanService extends BaseService<LoanInfo, String> {

    /**
     * 关键字模糊查询 - 客户信息
     *
     * @param paraMap 查询参数
     * @return 数据分页信息
     */
    PageInfo<LoanInfo> selectByKeyWord(Map<String, Object> paraMap);

    /**
     * 导出对应的贷款文档 - 到指定目录
     * @param csrForLoanFromDb 贷款信息
     * @param loan_db 客户信息
     */
    void export(PersonCustomer csrForLoanFromDb, LoanInfo loan_db, String exportDir) throws Exception;
}
