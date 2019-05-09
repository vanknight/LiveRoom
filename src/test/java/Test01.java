import com.live.service.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Create by IntelliJ IDEA
 *
 * @author: jsonor
 * @date-Time: 2018/11/12 11:16
 * @description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml","classpath:dispatcher-servlet.xml"})
public class Test01 {
    @Autowired
    private LiveService liveService;

    @Test
    public void test01(){

        System.out.println(liveService.getLiveGifts().size());

    }

}
