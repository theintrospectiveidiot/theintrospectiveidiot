#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>

// PLAYER:      "1"
// COMPUTER:    "2"

// represent the 2D grid as a 1D array 

// score: 0 if draw, 1 if won, -1 if lost => the scores arent like who won or something. 
// just numbers representing the scores independent of whose perspective is being evaluated

/*
    user makes move -> u try all the possible legal moves, and have some score, i guess? 
    you switch between the player and computer's perspectives until you reach a conclusion
    and give the scores accordingly...? like a node will have several branches. 
    now, the score would be the sum of indivisual scores of all the nodes from the branches
    do that recursively, i guess? i dont know man! like the leaf node will contain the result
    of that particular path...?
*/

typedef enum {
    PLAYER,
    COMPUTER
} Mode;

int empty_cells;                      

typedef struct Node Node;
typedef struct Branch Branch;

struct Node {
    int *game_state;            // anyone can make it no? the score would be accordingly evaluated
    int score;
    int temp_empty_cells;
    Mode mode;
    int is_it_leaf;
    int depth;

    Node *upper;

    Node *best_move;
    Branch **branch;
};

struct Branch {
    int move;                  // independent of who's making the move, depends entirely on the current mode!
    
    Node *node;
};

typedef enum {
    DRAW,
    PLAYER_WINS,
    COMPUTER_WINS,
    GAME_NOT_OVER
} Result;

Result check_game(int *grid);
void show(int *grid);


Node *make_node(int t_e_c, Mode mode, int *game_state, int move) {
    Node *new = malloc(sizeof(Node));
    
    new->temp_empty_cells = t_e_c - 1;
    new->game_state = malloc(sizeof(int) * 9);
    memcpy(new->game_state, game_state, sizeof(int) * 9);

    new->branch = malloc(sizeof(Branch*) * new->temp_empty_cells);
    new->is_it_leaf = 0;

    new->depth = 0;
    new->mode = mode;
    new->score = 0;
    new->upper = NULL;

    new->best_move = NULL;               //default value is zero.
                                 
    if (new->game_state[move]) {
        fprintf(stderr, "something's wrong!!");
        exit(1);
    }

    switch (new->mode) {
        case PLAYER:    new->game_state[move] = 1;
                        return new;
        
        case COMPUTER:  new->game_state[move] = 2;
                        return new;


        // maybe need to update this later                       
        default:        new->game_state[move] = 0;
                        return new;
    }
}

Branch *make_branch(int *game_state, int move, int empty_cells, Mode mode) {
    Branch *new_b = malloc(sizeof(Branch));

    new_b->move = move;
    new_b->node = make_node(empty_cells, (mode == PLAYER ? COMPUTER : PLAYER), game_state, move);

    return new_b;
}

/*
Node *do_stuff(Node *node) {
    switch (check_game(node->game_state)) {
        case GAME_NOT_OVER:

        case PLAYER_WINS:
            eval();
            return;

        case COMPUTER_WINS:
            eval();
            return;
    }
}
*/

void balloc(Node *node) {
    int b_count = 0;

    for (int i = 0; i < 9; i++) {
        if (!node->game_state[i]) {
            node->branch[b_count] = make_branch(node->game_state, i, node->temp_empty_cells, node->mode);
            node->branch[b_count]->node->upper = node;
            b_count += 1;
        }
    }
}

Result eval(Mode mode, int *game) {
    if (check_game(game) == DRAW) {
        return 0;
    }

    else if (check_game(game) == PLAYER_WINS) {
        return (mode == PLAYER ? 1 : -1);
    }

    else if (check_game(game) == COMPUTER_WINS) {
        return (mode == COMPUTER ? 1 : -1);
    }

    else return GAME_NOT_OVER;
}

Node *max(Node *a, Node *b) {
    return (a->score > b->score ? a : (a->score == b->score ? (a->depth <= b->depth ? a : b) : b));
}

Node *min(Node *a, Node *b) {
    return (a->score > b->score ? b : a);
}


Node *best(Node *node) {
    if (node->is_it_leaf) {
        return node;
    }

    Node *best = node->branch[0]->node;

    for (int i = 1; i < node->temp_empty_cells; i++) {
        best = max(best, node->branch[i]->node);        
        //printf("mode: %s\nmove %d -> score %d\n", (node->branch[i]->node->mode == COMPUTER ? "COMPUTER" : "PLAYER"), node->branch[i]->move, node->branch[i]->node->score);
    }
    // try to make some sort of depth counter...? i. e. to find the winning move in least amount of steps...
    // now of course celebrate that it works as you desired it to!!


    return best;
}

void communicate_with_ancestors(Node *node) {
    Node *temp = node;
    int counter = 0;
    
    while(temp != NULL) {
        temp->depth += counter;

        counter += 1;
        temp = temp->upper;
    }
}

void load_game_pro(Node *root) {
    if (!root->temp_empty_cells) {
        root->score = 0;
        root->is_it_leaf = 1;
        return;
    }

    //show(root->game_state);
    //printf("bonjour! je suis %s mode et je have %d empty cells in je game state\n", (root->mode == PLAYER ? "Player" : "Computer"), root->temp_empty_cells);

    balloc(root);
    
    for (int i = 0; i < root->temp_empty_cells; i++) {
        int temp;
        communicate_with_ancestors(root->branch[i]->node);

        if ((temp = eval(root->branch[i]->node->mode, root->branch[i]->node->game_state)) != GAME_NOT_OVER) {
            root->branch[i]->node->score = temp;
            root->branch[i]->node->is_it_leaf = 1;
        }
        
        else load_game_pro(root->branch[i]->node);
    }


    root->best_move = best(root);    
    root->score     = -(root->best_move->score);
}


Node *load_game(int move, Mode mode, int *game) {
    Node *root = make_node(empty_cells, mode, game, move);
    load_game_pro(root);
    return root;
}

int in_my_lingo(int pos[]) {
    return (pos[0] * 3) + pos[1];
}

void show(int *grid) {
    printf("\n");

    for (int i = 0; i < 3; i++) {
        printf("     |");
    }
    printf("\n");

    for (int i = 0; i < 3; i++) {
        printf("  %c  |", ((grid[i] == 0) ? 'E' : (grid[i] == 1 ? 'P' : 'C')));
    }
    printf("\n");

    for (int i = 0; i < 3; i++) {
        printf("_____|");
    }
    printf("\n");
    
    for (int i = 0; i < 3; i++) {
        printf("     |");
    }
    printf("\n");

    for (int i = 3; i < 6; i++) {
        printf("  %c  |", ((grid[i] == 0) ? 'E' : (grid[i] == 1 ? 'P' : 'C')));
    }
    printf("\n");

    for (int i = 0; i < 3; i++) {
        printf("_____|");
    }
    printf("\n");
    
    for (int i = 0; i < 3; i++) {
        printf("     |");
    }
    printf("\n");

    for (int i = 6; i < 9; i++) {
        printf("  %c  |", ((grid[i] == 0) ? 'E' : (grid[i] == 1 ? 'P' : 'C')));
    }
    printf("\n");
    
    for (int i = 0; i < 3; i++) {
        printf("     |");
    }
    printf("\n");

    printf("\n");
}

Result check_game(int *grid) {

    for(int i = 0; i < 9; i += 3) {
        if ((grid[i] == 1) && (grid[i + 1] == 1) && (grid[i + 2] == 1)) {
            return PLAYER_WINS;
        }
    
        else if ((grid[i] == 2) && (grid[i + 1] == 2) && (grid[i + 2] == 2)) {
            return COMPUTER_WINS;
        }
    }
    
    for(int i = 0; i < 3; i += 1) {
        if ((grid[i] == 1) && (grid[i + 3] == 1) && (grid[i + 6] == 1)) {
            return PLAYER_WINS;
        }
    
        else if ((grid[i] == 2) && (grid[i + 3] == 2) && (grid[i + 6] == 2)) {
            return COMPUTER_WINS;
        }
    }
    
    if ((grid[0] == 1) && (grid[4] == 1) && (grid[8] == 1)) {
        return PLAYER_WINS;
    }
    
    else if ((grid[0] == 2) && (grid[4] == 2) && (grid[8] == 2)) {
        return COMPUTER_WINS;
    }
    

    else if ((grid[2] == 1) && (grid[4] == 1) && (grid[6] == 1)) {
        return PLAYER_WINS;
    }
    
    else if ((grid[2] == 2) && (grid[4] == 2) && (grid[6] == 2)) {
        return COMPUTER_WINS;
    }

    for (int i = 0; i < 9; i++) {
        if (!grid[i])
            return GAME_NOT_OVER;
    }

    return DRAW;
}

void print_result(int *grid) {
    Result res = check_game(grid);

    if (res == GAME_NOT_OVER) {
        printf("Game not over!\n");
    }

    else if (res == PLAYER_WINS) {
        printf("Player wins!\n");
    }

    else if (res == COMPUTER_WINS) {
        printf("Computer Wins! Haha, U Sucker!!\n");
    }

    else if (res == DRAW) {
        printf("Draw!\n");
    }

    else printf("Don't know about the game now...\n");
}

void init_to_num(int *arr, int num) {
    memset(arr, num, sizeof(int) * 9);
}

int *init_game() {
    int *grid = malloc(sizeof(int) * 10);
    init_to_num(grid, 0);

    return grid;
}

// game stuff
// so one move at a time, right? how about u have a state (current game) and
// you are taking input from the player for his position and before you actually
// use it, u consider all the possible inputs, and make branches for them and
// u try to find the best possible position for you? and then when u get 
// the input, free the remaining nodes. do this recursively, i guess? 

// MINI-MAX ALGO!!!

/*`
void play() {
    //printf("Who goes first?\n(1) for Computer\n(2) for Player");
    int mode;
    int move[2];

    scanf("%d", &mode);

    if (mode == 1) {
    
    }


    printf("Enter your move (in the format [x y]): ");
        
    scanf("%d %d", &move[0], &move[1]);
    
    int *game = init_game();
    Node *root;

    root = load_game(int_my_lingo()); 

}
*/

int main(int argc, char **argv) {
    empty_cells = 9;
    
    int *game = init_game();
    
    game[0] = 2; empty_cells -= 1;
    game[8] = 2; empty_cells -= 1;
    game[1] = 1; empty_cells -= 1;

    Node *root = load_game(2, COMPUTER, game);
    
   
    Node *temp = root;

    
    while (1) {
    show(temp->game_state);

    Result result = check_game(temp->game_state);

    if (result != GAME_NOT_OVER) {
        print_result(temp->game_state);
        break;
    }

    temp = temp->best_move;
    }
    
    //printf("%d\n", root->score);
    //int game[9] = {0, 0, 2, 0, 2, 0, 2, 0, 0}; 

    //show(game);
}
