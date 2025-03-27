import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    public Karate Run(){
        return Karate.run("tests/API_Tests.feature").relativeTo(getClass());
    }
}