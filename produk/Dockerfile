# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM eclipse-temurin:17-jdk-focal
ADD target/produk-0.0.1-SNAPSHOT.jar produk.jar
expose 9001
ENTRYPOINT ["java","-jar", "/produk.jar"]