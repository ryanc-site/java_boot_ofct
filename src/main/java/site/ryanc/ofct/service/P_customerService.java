package site.ryanc.ofct.service;

import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;
import site.ryanc.ofct.model.PersonCustomer;

import java.util.List;
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
public interface P_customerService extends BaseService<PersonCustomer, String> {

    /**
     * 关键字模糊查询 - 客户信息
     *
     * @param paraMap 查询参数
     * @return 数据分页信息
     */
    PageInfo<PersonCustomer> selectByKeyWord(Map<String, Object> paraMap);

    /**
     * 依据客户名称 - 查询 - 客户信息
     * @param csr_name 客户名称
     * @return 客户信息
     */
    PersonCustomer getByCsrName(String csr_name);

    /**
     * 客户信息导入
     * @param csr_type 客户类型
     * @param import_file 导入文件
     */
    PersonCustomer importCsr(String csr_type, MultipartFile import_file) throws Exception;
}
