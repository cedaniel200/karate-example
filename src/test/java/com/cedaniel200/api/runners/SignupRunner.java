package com.cedaniel200.api.runners;

import com.intuit.karate.junit5.Karate;

class SignupRunner {
    @Karate.Test
    Karate test() {
        return Karate.run("../features/signup.feature")
                .relativeTo(getClass())
                .outputCucumberJson(true)
                .outputHtmlReport(true);
    }
}
