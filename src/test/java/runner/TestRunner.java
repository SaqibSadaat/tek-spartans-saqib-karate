package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
        return Karate
                .run("classpath:features")
                .karateEnv("dev") // --> is using from karate-config.js
                .tags("@End2EndAccount"); //--> for one test case and if you want to run the whole feature file just remote this line and close the above one
    }
}