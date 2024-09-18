#include "../Includes/minishell.h"


//retourne la longueur du tableau pour execve
int find_len_array(t_token **current_token)
{
    t_token *temp;
    int num_args;

    temp = (*current_token);
    if (temp->token_type == CMD)
    {
        num_args++;
        temp = temp->next;
    }
    while (temp->token_type == ARG)
    {
        num_args++;
        temp = temp->next;
    }
    return (num_args);
}

// cree le double tableau pour execve
// allouer de la place pour le tableau = cmd + args
// copier chaque cmd + args dans le double tableau
void    prepare_array(t_token **current_token)
{
    int num_args;
    int i;

    i = 0;
    num_args = find_len_array(current_token);
    char **args = malloc((num_args + 1) * sizeof(char *));
    while (num_args > 0)
    {
        args[i] = ft_strdup(current_token->str);
        i++;
        (*current_token) = (*current_token)->next;
        num_args--;
    }
    args[i] = NULL;
}

void    execute_cmd(t_token **current_token)

{

    prepare_array(token);

}

// verifier si c'est un builtin
// creer un double tableau avec la commande et les arguments pour execve
// execute_builtin
// else
void    handle_cmd(t_token **current_token)
{

    execute_cmd(current_token);
}


// parcours la ligne de commande
// gere heredoc
//si pipe ou redir configure
// si il y a une commande ajoute les arguments
//check si la commande est un builtins ou externe
//fork execve pour executer la commande
//passe au token suivant
//sort de la boucle a la fin de la ligne de commande
void exec(t_data *data)
{
    t_token **current_token;

    current_token = data->token;
    while(current_token)
    {
        if (current_token->token_type == CMD)
            handle_cmd(current_token);
        
    }
} 
 