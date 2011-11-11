/**
 * \mainpage Doubly Linked List Library
 * A completely useless and trivial implementation of a doubly linked list
 * library in C. Please do not use for anything serious.
 * \author Jeff Laughlin
 * \date (c)2008
*/

/**
 * \file dll.h
 * \brief Definitions for doubly linked list library
 */

/// A node in a doubly linked list
/**
 * All node fields must be initialized by the user. All operations not
 * specifically embodied in a function are the responsibility of the user.
*/
struct Node {
    struct Node *nextNode; ///<Pointer to the next Node in the list
    struct Node *prevNode; ///<Pointer to the previous Node in the list
    char *payload; ///<Pointer to a string
};

/// Given any node in a list, return the first node in the list
struct Node * getFirstNode(struct Node *node);

/// Given any node in a list, return the last node in the list
struct Node * getLastNode(struct Node *node);

/// Insert newNode in the list before rootNode
void insertBefore(struct Node *rootNode, struct Node *newNode);

/// Insert newNode in the list after rootNode
void insertAfter(struct Node *rootNode, struct Node *newNode);

/// Delete the node from the list
/**
 * Removes the given node from the list. This is done by linking it's previous
 * and next nodes to each other, and setting the given nodes previous and next
 * fields to NULL. Note that the memory used by the Node is not freed.
*/
void deleteNode(struct Node *node);

/// Search the list for a node containing searchString
/**
 * Given any node in a list, search the list for a node containing the given
 * search string and return a pointer to that node. Searches forwards, then
 * backwards from given node.
*/
struct Node * searchList(struct Node *node, char *searchString);

/// Join the strings in a list on a given string
/**
 * Given any node in a list, and a string, return the strings of all the nodes
 * in the list in list order with joinString inserted inbetween each one.
 * EG if the list contains ['foo', 'bar'], and it is joined with 'ack', the
 * result will be 'fooackbar'.
*/
char * joinList(struct Node *node, char *joinString);
