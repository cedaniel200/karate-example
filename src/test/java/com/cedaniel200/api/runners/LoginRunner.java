package com.cedaniel200.api.runners;

import com.intuit.karate.junit5.Karate;

class LoginRunner {

    @Karate.Test
    Karate test() {
        return Karate.run("../features/login.feature")
                .relativeTo(getClass())
                .outputCucumberJson(true)
                .outputHtmlReport(true);
    }

}


