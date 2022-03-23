package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class SpartanDataGenerator {

    public static Map<String, Object> createSpartan(){
        Map<String , Object> oneSpartan = new HashMap<>();
        Faker faker = new Faker();
        String spartanName = faker.name().firstName();
        String gender = faker.demographic().sex();
        long phone = Long.parseLong(faker.numerify("##########"));

        oneSpartan.put("name", spartanName);
        oneSpartan.put("gender", gender);
        oneSpartan.put("phone", phone);

        return  oneSpartan;
    }

}
