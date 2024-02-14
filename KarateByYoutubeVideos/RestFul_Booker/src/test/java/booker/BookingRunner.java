package booker;

import com.intuit.karate.junit5.Karate;

public class BookingRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("booker").relativeTo(getClass());
    }


//    @Karate.Test
//    Karate testUsers() {
//        return Karate.run("booker")
//        .tags("@Smoke")
//        .relativeTo(getClass());
//    }
}
