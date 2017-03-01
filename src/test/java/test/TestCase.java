package test;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Column;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;
import com.instrument.dao.InstrumentTypeDAO;
import com.instrument.domain.InstrumentType;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath*:/spring-mybatis.xml" })
public class TestCase {
	@Resource
	private InstrumentTypeDAO itd;

	@Test
	public void test() {
		PageHelper.startPage(1, 1); // 核心分页代码
		List<InstrumentType> cls = itd.getInstrumentType();
		for (InstrumentType column : cls) {
			System.out.println(column.getInstrumenttypename());
		}
	}
}
