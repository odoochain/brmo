package nl.b3p.brmo.soap;

import static nl.b3p.brmo.test.util.WebXmlTest.testWebXmlIsValidSchemaJavaEE7;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import org.junit.jupiter.api.Test;

public class WebXmlTest {
  @Test
  public void validateWebXml() throws Exception {
    File webxml = new File("src/main/webapp/WEB-INF/web.xml");
    assertTrue(testWebXmlIsValidSchemaJavaEE7(webxml), "`web.xml` is niet geldig");
  }
}
