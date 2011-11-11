// dll_unit.c
// (c)2008 Jeffrey Laughlin
// Part of the doubly linked list library
// CUnit based unit tests. Just compile and run.

#include <stdlib.h>
#include <dll.h>
#include <CUnit/Basic.h>

struct Node *threeNodes[3];
struct Node *twoNodes[2];
struct Node *oneNode;

int init_suite1(void) {
    threeNodes[0] = malloc(sizeof (struct Node));
    threeNodes[1] = malloc(sizeof (struct Node));
    threeNodes[2] = malloc(sizeof (struct Node));
    twoNodes[0] = malloc(sizeof (struct Node));
    twoNodes[1] = malloc(sizeof (struct Node));
    oneNode = malloc(sizeof (struct Node));
    return 0;
}


void setupNodes(void) {
    threeNodes[0]->prevNode = NULL;
    threeNodes[0]->nextNode = threeNodes[1];
    threeNodes[0]->payload = "Cherokee";
    threeNodes[1]->prevNode = threeNodes[0];
    threeNodes[1]->nextNode = threeNodes[2];
    threeNodes[1]->payload = "Comanchee";
    threeNodes[2]->prevNode = threeNodes[1];
    threeNodes[2]->nextNode = NULL;
    threeNodes[2]->payload = "Chief";

    twoNodes[0]->prevNode = NULL;
    twoNodes[0]->nextNode = twoNodes[1];
    twoNodes[0]->payload = "Wrangler";
    twoNodes[1]->prevNode = twoNodes[0];
    twoNodes[1]->nextNode = NULL;
    twoNodes[1]->payload = "CJ";

    oneNode->prevNode = NULL;
    oneNode->nextNode = NULL;
    oneNode->payload = "Jeepster";
}


int clean_suite1(void) {
    free(threeNodes[0]);
    free(threeNodes[1]);
    free(threeNodes[2]);
    free(twoNodes[0]);
    free(twoNodes[1]);
    free(oneNode);
    return 0;
}


void test_getFirstNode(void) {
    setupNodes();

    CU_ASSERT_PTR_EQUAL(getFirstNode(threeNodes[0]), threeNodes[0]);
    CU_ASSERT_PTR_EQUAL(getFirstNode(threeNodes[1]), threeNodes[0]);
    CU_ASSERT_PTR_EQUAL(getFirstNode(threeNodes[2]), threeNodes[0]);

    CU_ASSERT_PTR_EQUAL(getFirstNode(twoNodes[0]), twoNodes[0]);
    CU_ASSERT_PTR_EQUAL(getFirstNode(twoNodes[1]), twoNodes[0]);

    CU_ASSERT_PTR_EQUAL(getFirstNode(oneNode), oneNode);
}


void test_getLastNode(void) {
    setupNodes();

    CU_ASSERT_PTR_EQUAL(getLastNode(threeNodes[0]), threeNodes[2]);
    CU_ASSERT_PTR_EQUAL(getLastNode(threeNodes[1]), threeNodes[2]);
    CU_ASSERT_PTR_EQUAL(getLastNode(threeNodes[2]), threeNodes[2]);

    CU_ASSERT_PTR_EQUAL(getLastNode(twoNodes[0]), twoNodes[1]);
    CU_ASSERT_PTR_EQUAL(getLastNode(twoNodes[1]), twoNodes[1]);

    CU_ASSERT_PTR_EQUAL(getLastNode(oneNode), oneNode);
}


void test_insertBefore(void) {
    setupNodes();

    insertBefore(twoNodes[0], oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->prevNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->nextNode, twoNodes[1]);
    CU_ASSERT_PTR_EQUAL(oneNode->nextNode, twoNodes[0]);
    CU_ASSERT_PTR_EQUAL(oneNode->prevNode, NULL);

    twoNodes[0]->prevNode = NULL;
    insertBefore(twoNodes[1], oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->prevNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->nextNode, NULL);
    CU_ASSERT_PTR_EQUAL(oneNode->nextNode, twoNodes[1]);
    CU_ASSERT_PTR_EQUAL(oneNode->prevNode, twoNodes[0]);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->nextNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->prevNode, NULL);
}


void test_insertAfter(void) {
    setupNodes();
    
    insertAfter(twoNodes[1], oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->nextNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->prevNode, twoNodes[0]);
    CU_ASSERT_PTR_EQUAL(oneNode->prevNode, twoNodes[1]);
    CU_ASSERT_PTR_EQUAL(oneNode->nextNode, NULL);

    twoNodes[1]->nextNode = NULL;
    insertAfter(twoNodes[0], oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->prevNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[1]->nextNode, NULL);
    CU_ASSERT_PTR_EQUAL(oneNode->nextNode, twoNodes[1]);
    CU_ASSERT_PTR_EQUAL(oneNode->prevNode, twoNodes[0]);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->nextNode, oneNode);
    CU_ASSERT_PTR_EQUAL(twoNodes[0]->prevNode, NULL);
}


void test_deleteNode(void) {
    setupNodes();

    deleteNode(threeNodes[1]);
    CU_ASSERT_PTR_EQUAL(threeNodes[1]->prevNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[1]->nextNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[0]->nextNode, threeNodes[2]);
    CU_ASSERT_PTR_EQUAL(threeNodes[2]->prevNode, threeNodes[0]);

    deleteNode(threeNodes[0]);
    CU_ASSERT_PTR_EQUAL(threeNodes[0]->prevNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[0]->nextNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[2]->nextNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[2]->prevNode, NULL);

    deleteNode(threeNodes[0]);
    CU_ASSERT_PTR_EQUAL(threeNodes[0]->prevNode, NULL);
    CU_ASSERT_PTR_EQUAL(threeNodes[0]->nextNode, NULL);
    CU_PASS("Didn't freak out on deleteing a one node list");
}


void test_searchList(void) {
    setupNodes();

    CU_ASSERT_PTR_EQUAL(searchList(threeNodes[0], "Chief"), threeNodes[2]);
    CU_ASSERT_PTR_EQUAL(searchList(threeNodes[2], "Chief"), threeNodes[2]);
    CU_ASSERT_PTR_EQUAL(searchList(threeNodes[2], "Cherokee"), threeNodes[0]);
    CU_ASSERT_PTR_EQUAL(searchList(threeNodes[0], "Cherokee"), threeNodes[0]);
    
    CU_ASSERT_PTR_EQUAL(searchList(oneNode, "Jeepster"), oneNode);

    CU_ASSERT_PTR_EQUAL(searchList(threeNodes[2], "foobar"), NULL);
}


void test_joinList(void) {
    setupNodes();

    CU_ASSERT_STRING_EQUAL(joinList(threeNodes[0], " "), 
            "Cherokee Comanchee Chief");

    CU_ASSERT_STRING_EQUAL(joinList(twoNodes[0], " "), 
            "Wrangler CJ");

    CU_ASSERT_STRING_EQUAL(joinList(threeNodes[2], " and "), 
            "Cherokee and Comanchee and Chief");

    CU_ASSERT_STRING_EQUAL(joinList(oneNode, " "), 
            "Jeepster");
}


int main() {
    CU_pSuite pSuite = NULL;

    /* initialize the CUnit test registry */
    if (CUE_SUCCESS != CU_initialize_registry())
        return CU_get_error();

    /* add a suite to the registry */
    pSuite = CU_add_suite("Suite_1", init_suite1, clean_suite1);
    if (NULL == pSuite) {
       CU_cleanup_registry();
       return CU_get_error();
    }

    /* add the tests to the suite */
    if ((NULL == CU_add_test(pSuite, "test of getFirstNode", test_getFirstNode))
            || (NULL == CU_add_test(pSuite, "test of getLastNode", test_getLastNode))
            || (NULL == CU_add_test(pSuite, "test of insertBefore", test_insertBefore))
            || (NULL == CU_add_test(pSuite, "test of insertAfter", test_insertAfter))
            || (NULL == CU_add_test(pSuite, "test of searchList", test_searchList))
            || (NULL == CU_add_test(pSuite, "test of joinList", test_joinList))
            || (NULL == CU_add_test(pSuite, "test of deleteNode", test_deleteNode)))
    {
       CU_cleanup_registry();
       return CU_get_error();
    }

    /* Run all tests using the CUnit Basic interface */
    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return CU_get_error();
}
