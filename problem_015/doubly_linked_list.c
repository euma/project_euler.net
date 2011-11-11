// dll.c
// Part of the doubly linked list library
// (c) 2008 Jeff Laughlin

#include <stdlib.h>
#include <error.h>
#include <err.h>
#include <string.h>
#include <dll.h>
#define CHUNK_SIZE 1024*4

struct Node * getFirstNode(struct Node *node) {
    while (node->prevNode != NULL)
        node = node->prevNode;
    return node;
}

struct Node * getLastNode(struct Node *node) {
    while (node->nextNode != NULL)
        node = node->nextNode;
    return node;
}

void insertBefore(struct Node *rootNode, struct Node *newNode) {
    if (rootNode->prevNode != NULL) {
        rootNode->prevNode->nextNode = newNode;
        newNode->prevNode = rootNode->prevNode;
    }
    else {
        newNode->prevNode = NULL;
    }

    rootNode->prevNode = newNode;
    newNode->nextNode = rootNode;
}

void insertAfter(struct Node *rootNode, struct Node *newNode) {
    if (rootNode->nextNode != NULL) {
        rootNode->nextNode->prevNode = newNode;
        newNode->nextNode = rootNode->nextNode;
    }
    else {
        newNode->nextNode = NULL;
    }

    rootNode->nextNode = newNode;
    newNode->prevNode = rootNode;
}

void deleteNode(struct Node *node) {
    if (node->prevNode != NULL)
        node->prevNode->nextNode = node->nextNode;

    if (node->nextNode != NULL)
        node->nextNode->prevNode = node->prevNode;

    node->prevNode = NULL;
    node->nextNode = NULL;
}

struct Node * searchList(struct Node *node, char *searchString) {
    struct Node * currentNode;
    struct Node sentinalStruct;
    struct Node * sentinal = &sentinalStruct;

    // search forward
    sentinal->prevNode = NULL;
    sentinal->nextNode = node;
    currentNode = sentinal;
    do {
        currentNode = currentNode->nextNode;
        if (strcmp(currentNode->payload, searchString) == 0)
            return currentNode;
    }
    while (currentNode->nextNode != NULL);

    // search backwards
    sentinal->nextNode = NULL;
    sentinal->prevNode = node;
    currentNode = sentinal;
    do {
        currentNode = currentNode->prevNode;
        if (strcmp(currentNode->payload, searchString) == 0)
            return currentNode;
    }
    while (currentNode->prevNode != NULL);

    return NULL;
}


char * joinList(struct Node *node, char *joinString) {
    char * retString;
    size_t retStringSize = CHUNK_SIZE;
    size_t payloadLength;
    size_t retStringLength;
    size_t joinStringLength;
    struct Node dummyFirst;
    struct Node * ptrDummyFirst = &dummyFirst;

    joinStringLength = strlen(joinString);

    // move to first node
    node = getFirstNode(node);
    if (node->nextNode == NULL)
        return node->payload;

    retString = malloc(retStringSize);
    if (retString == NULL)
        err(1, "Malloc failed");
    retString[0] = (char)NULL;

    ptrDummyFirst->nextNode = node;
    node = ptrDummyFirst;

    // Iterate over nodes
    do {
        node = node->nextNode;
        // is retString big enough? realloc if necessary
        payloadLength = strlen(node->payload);
        retStringLength = strlen(retString);

        while (payloadLength + retStringLength + joinStringLength + 1 > retStringSize) {
            // Hypothetically, if the string being joined was many times larger
            // than CHUNK_SIZE, it would be faster to just allocate that many
            // chunks at once. But that would be one long string!
            if (payloadLength + joinStringLength + 1 > CHUNK_SIZE)
                retStringSize = retStringSize + (payloadLength + joinStringLength + 1) / CHUNK_SIZE * CHUNK_SIZE;
            else
                retStringSize += CHUNK_SIZE;
            retString = realloc(retString, retStringSize);
            if (retString == NULL)
                err(1, "Malloc failed");
        }

        strcat(retString, node->payload);
        if (node->nextNode != NULL)
            strcat(retString, joinString);

    }
    while (node->nextNode != NULL);

    return retString;
}
