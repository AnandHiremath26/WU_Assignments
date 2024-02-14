import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BookerTest {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:booker")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

//    @Test
//    void testParallel() {
//        Results results = Runner.path("classpath:booker")
//                  .tags("@Smoke")
//                //.outputCucumberJson(true)
//                .parallel(5);
//        assertEquals(0, results.getFailCount(), results.getErrorMessages());
//    }
}
