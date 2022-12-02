# IT Project - Automatische GUI testen
1. Maven installeren en toevoegen aan de environment variables van de pc (https://phoenixnap.com/kb/install-maven-windows)
2. Test classes moeten eindigen op "Test"
3. Volgende toevoegen aan \<dependencies> in POM.xml:
```
        <dependency>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>2.22.2</version>
        </dependency>
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-api</artifactId>
            <version>2.0.5</version>
        </dependency>
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-simple</artifactId>
            <version>2.0.5</version>
        </dependency>
```
4. Volgende toevoegen aan POM.xml (buiten \<dependencies>) en dan POM refreshen
```
    <build>
        <plugins>
            <plugin>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
                <configuration>
                    <excludes>
                        <exclude>FileWithTestsYouDoNotWantToTest.java</exclude>
                    </excludes>
                    <includes>
                        <include>FileWithTestsYouWantToTest.java</include>
                    </includes>
                </configuration>
            </plugin>
        </plugins>
    </build>
```
5. Testen runnen in een terminal in Intelij met:
```
mvn test
```
6. testng-results.xml (in target/surefire-reports) klaar maken voor XRay met het script PrepareFileForXRay.ps1
        I. Veranderd de input location van het script naar de locatie waar je testng-results.xml staat
