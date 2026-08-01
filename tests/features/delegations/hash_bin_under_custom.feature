Feature: Create succinct hash-bin delegations under custom delegations
    User has deployed RSTUF,

    Scenario Outline: User opts for succinct hash‑bin delegations under custom delegation while performing ceremony
        Given repository-service-tuf (RSTUF) is installed
        When the User starts the ceremony
        And chooses to create a custom delegation named "<delegation_name>"
        And the User enters the remaining required details for the custom delegation
        Then RSTUF prompts:
            | Prompt                                                                 |
            | "Do you want further hash‑bin delegations under this <delegation_name> delegation (y/n)?" |
        When the User enters "y"
        Then RSTUF prompts:
            | Prompt                                                                 |
            | "Number of bins (2/4/8/16/32/64/128/256/512/1024/2048/4096):"          |
        When the User chooses the number "<bins>" to use
        Then the CLI displays the generated delegation metadata, including the hash‑bin structure

        Examples:
            | delegation_name | bins |
            | downloads       | 16   |
            | releases        | 1024 |

    Scenario Outline: User opts for succinct hash‑bin delegations under custom delegation after performing ceremony
        Given repository-service-tuf (RSTUF) is installed
        And ceremony is completed
        When the User opts to add new delegation
        And chooses to create a custom delegation named "<delegation_name>"
        And the User enters the remaining required details for the custom delegation
        Then RSTUF prompts:
            | Prompt                                                                 |
            | "Do you want further hash‑bin delegations under this <delegation_name> delegation (y/n)?" |
        When the User enters "y"
        Then RSTUF prompts:
            | Prompt                                                                 |
            | "Number of bins (2/4/8/16/32/64/128/256/512/1024/2048/4096):"          |
        When the User chooses the number "<bins>" to use
        Then the CLI displays the generated delegation metadata, including the hash‑bin structure

        Examples:
            | delegation_name | bins |
            | project-a       | 256  |
