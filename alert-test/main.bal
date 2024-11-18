import ballerina/io;
import ballerina/log;
import ballerina/http;

public function main() {
    io:println("Hello, World!");
}

service /srvc on new http:Listener(8080) {
    resource function get hello() returns string|error {
        log:printInfo("Hello, World!");
        io:println("Hello, World!");
        return "Hello, World!";
    }

    resource function get logerror() returns string|error {
        log:printError("Error occurred");
        io:println("Error occurred");
        return error("Error occurred");
    }

    resource function get setoom() returns string|error {
        log:printInfo("making the ballerina process to run out of memory");

        int[*] arr = [];
        int i = 0;

        while true {
            int j = 1000000000000;
            int k = 1;
            while j == 0 {
                j = j - 1;
                k = k*j;
            }
            arr[i] = k;
            i = i + 1;

            if (i == 1000000000000) {
                break;
            }
        }
        return "Out of memory";
    }

    resource function get builderror() returns string|error {
        log:printError("Error occurred");
        io:println("Error occurred");
        return "Fix Build Error";
    }
}