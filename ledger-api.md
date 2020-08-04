

List of messages that are available to send

        UNDEFINED = 0;

        REGISTER = 1;
                                                REGISTERED = 2;
                                                READY = 4;
                                                INIT = 3;
                                                TRANSACTION = 5;
        COMPLETED = 6;
        ERROR = 7;                              ERROR = 7;
                                                RESPONSE = 13;
        INVOKE_CHAINCODE = 11;                  INVOKE_CHAINCODE = 11;
        
        GET_STATE = 8;
        PUT_STATE = 9;
        DEL_STATE = 10;
        GET_STATE_BY_RANGE = 14;
        GET_QUERY_RESULT = 15;
        QUERY_STATE_NEXT = 16;
        QUERY_STATE_CLOSE = 17;
        GET_HISTORY_FOR_KEY = 19;
        GET_STATE_METADATA = 20;
        PUT_STATE_METADATA = 21;
        GET_PRIVATE_DATA_HASH = 22;

        KEEPALIVE = 18;  // can't see this being used