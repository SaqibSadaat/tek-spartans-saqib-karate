package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
        return Karate.run("classpath:features")
                .karateEnv("qa") // --> is using from karate-config.js
                .tags("@PlanCode_1"); //--> for one test case and if you want to run the whole feature file just remote this line and close the above one
    }
}
