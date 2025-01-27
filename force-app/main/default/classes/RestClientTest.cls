/**
 * Created by DDiaconescu on 20/11/2018.
 */

/**
* RestClientTest.cls
* Description: Test class for RestClient
**/
@IsTest
public class RestClientTest {

    /**
     * errors
     */
    @IsTest
    static void getNow_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );

        Test.setMock(HttpCalloutMock.class, responseMock);

        x_api_key__c apiKey = new x_api_key__c();
        apiKey.Name = namedCredential;
        apiKey.value__c = generateRandomString(32);
        insert apiKey;

        Test.startTest();
        RestClient.RestResult result = RestClient.getNow(namedCredential, path);
        RestClient.writeLogEvent();
        Test.stopTest();

        System.assertEquals(false, result.success);
        System.assertEquals(expectedResponseBody, result.data);
        System.assert(result.error.contains(String.valueOf(expectedResponseCode)));
        System.assert(result.error.contains(String.valueOf(expectedResponseBody)));

        Rest_Log__c restLog = [SELECT Id, Method__c, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals('GET', restLog.Method__c);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }

    @IsTest
    static void getFuture_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.getFuture(namedCredential, path);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }

    @IsTest
    static void getQueued_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.getQueued(namedCredential, path);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Method__c, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals('GET', restLog.Method__c);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }

    @IsTest
    static void postNow_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String requestBody = 'request body';
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        x_api_key__c apiKey = new x_api_key__c();
        apiKey.Name = namedCredential;
        apiKey.value__c = generateRandomString(32);
        insert apiKey;

        Test.startTest();
        RestClient.RestResult result = RestClient.postNow(namedCredential, path, requestBody);
        RestClient.writeLogEvent();
        Test.stopTest();

        System.assertEquals(false, result.success);
        System.assertEquals(expectedResponseBody, result.data);
        System.assert(result.error.contains(String.valueOf(expectedResponseCode)));
        System.assert(result.error.contains(String.valueOf(expectedResponseBody)));

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }

    @IsTest
    static void postFuture_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String requestBody = 'request body';
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.postFuture(namedCredential, path, requestBody);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }


    @IsTest
    static void postQueued_should_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String requestBody = 'request body';
        String expectedResponseBody = 'failure body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.postQueued(namedCredential, path, requestBody);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Method__c, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals('POST', restLog.Method__c);
        System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLog.Status__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseCode)));
        System.assert(restLog.Message__c.contains(String.valueOf(expectedResponseBody)));

    }


    /**
     * success
     */

    @IsTest
    static void getNow_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.RestResult result = RestClient.getNow(namedCredential, path);
        RestClient.writeLogEvent();
        Test.stopTest();

        System.assertEquals(true, result.success);
        System.assertEquals(expectedResponseBody, result.data);
        System.assertEquals(null, result.error);

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);

    }


    @IsTest
    static void getFuture_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.getFuture(namedCredential, path);
        RestClient.writeLogEvent();
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
    }

    @IsTest
    static void getQueued_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.getQueued(namedCredential, path);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
    }


    @IsTest
    static void postNow_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String requestBody = 'request body';
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.RestResult result = RestClient.postNow(namedCredential, path, requestBody);
        RestClient.writeLogEvent();
        Test.stopTest();

        System.assertEquals(true, result.success);
        System.assertEquals(expectedResponseBody, result.data);
        System.assertEquals(null, result.error);

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);

    }


    @IsTest
    static void postFuture_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String requestBody = 'request body';
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.postFuture(namedCredential, path, requestBody);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);

    }

    @IsTest
    static void postQueued_should_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String requestBody = 'request body';
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.postQueued(namedCredential, path, requestBody);
        Test.stopTest();

        Rest_Log__c restLog = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c LIMIT 1];

        System.assert(restLog != null);
        System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
        System.assertEquals(requestBody, restLog.Request_Body__c);
        System.assertEquals(expectedResponseBody, restLog.Response_Body__c);

    }


    @IsTest
    static void invocable_get_return_error() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String expectedResponseBody = 'failure body';


        RestClient.InvocableObject invocableObjectGetNow = new RestClient.InvocableObject();
        invocableObjectGetNow.namedCredential = namedCredential;
        invocableObjectGetNow.path = path;
        invocableObjectGetNow.method = 'GET';
        invocableObjectGetNow.future = false;

        RestClient.InvocableObject invocableObjectGetFuture = new RestClient.InvocableObject();
        invocableObjectGetFuture.namedCredential = namedCredential;
        invocableObjectGetFuture.path = path;
        invocableObjectGetFuture.method = 'GET';
        invocableObjectGetFuture.future = true;

        List<RestClient.RestResult> restResultListGetNow;
        List<RestClient.RestResult> restResultListGetFuture;

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();

        restResultListGetFuture = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                    invocableObjectGetFuture
        });

        restResultListGetNow = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectGetNow
        });

        Test.stopTest();

        RestClient.RestResult resultGetNow = restResultListGetNow[0];


        System.assertEquals(false, resultGetNow.success);
        System.assertEquals(expectedResponseBody, resultGetNow.data);
        System.assert(resultGetNow.error.contains(String.valueOf(expectedResponseCode)));
        System.assert(resultGetNow.error.contains(String.valueOf(expectedResponseBody)));


        List<Rest_Log__c> restLogList = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c];

        system.assertEquals(2, restLogList.size());

        for (Integer i = 0; i < restLogList.size(); i++) {
            System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLogList[i].Status__c);
            System.assertEquals(expectedResponseBody, restLogList[i].Response_Body__c);
            System.assert(restLogList[i].Message__c.contains(String.valueOf(expectedResponseCode)));
            System.assert(restLogList[i].Message__c.contains(String.valueOf(expectedResponseBody)));
        }

    }



    @IsTest
    static void invocable_post_return_error() {


        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 403;
        String requestBody = 'request body';
        String expectedResponseBody = 'failure body';

        RestClient.InvocableObject invocableObjectPostNow = new RestClient.InvocableObject();
        invocableObjectPostNow.namedCredential = namedCredential;
        invocableObjectPostNow.path = path;
        invocableObjectPostNow.method = 'POST';
        invocableObjectPostNow.future = false;
        invocableObjectPostNow.body = requestBody;

        RestClient.InvocableObject invocableObjectPostFuture = new RestClient.InvocableObject();
        invocableObjectPostFuture.namedCredential = namedCredential;
        invocableObjectPostFuture.path = path;
        invocableObjectPostFuture.method = 'POST';
        invocableObjectPostFuture.future = true;
        invocableObjectPostFuture.body = requestBody;

        List<RestClient.RestResult> restResultListPostNow;
        List<RestClient.RestResult> restResultListPostFuture;

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_FAILURE,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();

        restResultListPostFuture = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectPostFuture
        });

        restResultListPostNow = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectPostNow
        });

        Test.stopTest();

        RestClient.RestResult resultPostNow = restResultListPostNow[0];

        System.assertEquals(false, resultPostNow.success);
        System.assertEquals(expectedResponseBody, resultPostNow.data);
        System.assert(resultPostNow.error.contains(String.valueOf(expectedResponseCode)));
        System.assert(resultPostNow.error.contains(String.valueOf(expectedResponseBody)));


        List<Rest_Log__c> restLogList = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c];

        system.assertEquals(2, restLogList.size());

        for (Integer i = 0; i < restLogList.size(); i++) {
            System.assertEquals(RestLogBuilder.STATUS_FAILURE, restLogList[i].Status__c);
            System.assertEquals(expectedResponseBody, restLogList[i].Response_Body__c);
            System.assert(restLogList[i].Message__c.contains(String.valueOf(expectedResponseCode)));
            System.assert(restLogList[i].Message__c.contains(String.valueOf(expectedResponseBody)));
        }

    }


    @IsTest
    static void invocable_get_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String expectedResponseBody = 'success body';


        RestClient.InvocableObject invocableObjectGetNow = new RestClient.InvocableObject();
        invocableObjectGetNow.namedCredential = namedCredential;
        invocableObjectGetNow.path = path;
        invocableObjectGetNow.method = 'GET';
        invocableObjectGetNow.future = false;

        RestClient.InvocableObject invocableObjectGetFuture = new RestClient.InvocableObject();
        invocableObjectGetFuture.namedCredential = namedCredential;
        invocableObjectGetFuture.path = path;
        invocableObjectGetFuture.method = 'GET';
        invocableObjectGetFuture.future = true;

        List<RestClient.RestResult> restResultListGetNow;
        List<RestClient.RestResult> restResultListGetFuture;

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();

        restResultListGetFuture = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectGetFuture
        });

        restResultListGetNow = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectGetNow
        });

        Test.stopTest();

        RestClient.RestResult resultGetNow = restResultListGetNow[0];

        System.assertEquals(true, resultGetNow.success);
        System.assertEquals(expectedResponseBody, resultGetNow.data);
        System.assertEquals(null, resultGetNow.error);


        List<Rest_Log__c> restLogList = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c];

        system.assertEquals(2, restLogList.size());

        for (Integer i = 0; i < restLogList.size(); i++) {
            System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLogList[i].Status__c);
            System.assertEquals(expectedResponseBody, restLogList[i].Response_Body__c);
            System.assertEquals(null, restLogList[i].Message__c);
        }

    }



    @IsTest
    static void invocable_post_return_success() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String requestBody = 'request body';
        String expectedResponseBody = 'success body';

        RestClient.InvocableObject invocableObjectPostNow = new RestClient.InvocableObject();
        invocableObjectPostNow.namedCredential = namedCredential;
        invocableObjectPostNow.path = path;
        invocableObjectPostNow.method = 'POST';
        invocableObjectPostNow.future = false;
        invocableObjectPostNow.body = requestBody;

        RestClient.InvocableObject invocableObjectPostFuture = new RestClient.InvocableObject();
        invocableObjectPostFuture.namedCredential = namedCredential;
        invocableObjectPostFuture.path = path;
        invocableObjectPostFuture.method = 'POST';
        invocableObjectPostFuture.future = true;
        invocableObjectPostFuture.body = requestBody;

        List<RestClient.RestResult> restResultListPostNow;
        List<RestClient.RestResult> restResultListPostFuture;

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();

        restResultListPostFuture = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectPostFuture
        });

        restResultListPostNow = RestClient.restInvokable(new List<RestClient.InvocableObject>{
                invocableObjectPostNow
        });

        Test.stopTest();

        RestClient.RestResult resultPostNow = restResultListPostNow[0];

        System.assertEquals(true, resultPostNow.success);
        System.assertEquals(expectedResponseBody, resultPostNow.data);
        System.assertEquals(null, resultPostNow.error);

        List<Rest_Log__c> restLogList = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c];

        system.assertEquals(2, restLogList.size());

        for (Integer i = 0; i < restLogList.size(); i++) {
            System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLogList[i].Status__c);
            System.assertEquals(expectedResponseBody, restLogList[i].Response_Body__c);
            System.assertEquals(null, restLogList[i].Message__c);
        }

    }


    @IsTest
    static void eventLog_Test() {

        String namedCredential = 'namedCredential';
        String path = 'path';
        Integer expectedResponseCode = 200;
        String requestBody = 'request body';
        String expectedResponseBody = 'success body';

        RestMock responseMock = new RestMock(
                expectedResponseCode,
                RestLogBuilder.STATUS_SUCCESS,
                expectedResponseBody,
                new Map<String, String>()
        );
        Test.setMock(HttpCalloutMock.class, responseMock);

        Test.startTest();
        RestClient.RestResult result1 = RestClient.postNow(namedCredential, path, requestBody);
        RestClient.RestResult result2 = RestClient.postNow(namedCredential, path, requestBody);
        RestClient.writeLogEvent();
        Test.stopTest();

        System.assertEquals(true, result1.success);
        System.assertEquals(expectedResponseBody, result1.data);
        System.assertEquals(null, result1.error);

        System.assertEquals(true, result2.success);
        System.assertEquals(expectedResponseBody, result2.data);
        System.assertEquals(null, result2.error);

        List<Rest_Log__c> restLogList = [SELECT Id, Status__c, Message__c, Request_Body__c, Response_Body__c FROM Rest_Log__c];

        System.assertEquals(2, restLogList.size());

        for (Rest_Log__c restLog : restLogList) {
            System.assert(restLog != null);
            System.assertEquals(RestLogBuilder.STATUS_SUCCESS, restLog.Status__c);
            System.assertEquals(expectedResponseBody, restLog.Response_Body__c);
            System.assertEquals(requestBody, restLog.Request_Body__c);
        }


    }

    public static String generateRandomString(Integer len) {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len) {
            Integer idx = getRandomInt(0, chars.length() - 1);
            randStr += chars.substring(idx, idx + 1);
        }
        return randStr;
    }

    public static Integer getRandomInt(Integer lower, Integer upper) {
        return Math.round(Math.random() * (upper - lower)) + lower;
    }

}