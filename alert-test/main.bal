import ballerina/io;
import ballerina/log;
import ballerina/http;

public function main() {
    io:println("Hello, World!");
}

configurable string buildFailOnConfigMismatch = ?;
configurable string buildFailOnConfigMismatch2 = ?;

service /srvc on new http:Listener(8080) {
    resource function get hello() returns string|error {
        log:printInfo("Hello, World!");
        io:println("Hello, World!");
        return "Hello, World!";
    }

    resource function get logerror() returns string|error {
        log:printError("Error occurred; alert should be triggered for error logs");
        log:printInfo("Error occurred; alert should be triggered for error logs");
        io:println("Error occurred; alert should be triggered for error logs");

        return error("Error occurred");
    }

    resource function get setoom() returns error {
        log:printInfo("making the ballerina process to run out of memory");

        any[] memoryList = [];

        while true {
            byte[] chunk = [];
            foreach int i in 0 ..< (100*1024*1024) {
                chunk.push(1);
            }
            memoryList.push(chunk);
            log:printInfo("Memory chunk added. Total memory: " + memoryList.length().toString());
        }
    }

    resource function get builderror() returns string|error {
        log:printError("Error occurred");
        io:println("Error occurred");
        return "Fix Build Error";
    }

}
