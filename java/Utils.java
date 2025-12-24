package k.springtemplate;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@UtilityClass
public class Utils {

    public void printAllColors() {
        if (log.isInfoEnabled()) {
            System.out.print("Colors: ");
            for (int i = 0; i < 128; i++) {
                System.out.printf(" \u001B[%dm%d\u001B[0m", i, i);
            }
            System.out.println();
        }
    }
}
