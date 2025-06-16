#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    node *fast_ptr = head;
    node *slow_ptr = head;
    do{
        if(head == NULL || fast_ptr->next == NULL){
            return 0;
        }
        fast_ptr = fast_ptr->next->next;
        slow_ptr = slow_ptr->next;
        if (fast_ptr == slow_ptr){
            return 1;
        }
    }while(fast_ptr != NULL);
    return 0;
}
