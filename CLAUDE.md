# Kohisar

ERP-style application covering **accounting, inventory, purchase, sale, production, and user management**.

## Stack
- Laravel 6
- Bootstrap (UI), jQuery + AJAX (frontend interactions)

## Project Structure
- Business logic goes in `app/Services/` (not in controllers)
- Validation uses Form Requests in `app/Http/Requests/`

## Coding Rules
- Keep controllers thin; call services
- Use Eloquent relationships, avoid raw queries unless needed
- Wrap multi-table writes in `DB::transaction()`
- Use eager loading to avoid N+1 queries
- Follow PSR-12; run Pint before finishing
- Write a Feature test for every new endpoint

## Database
- Never edit an existing migration; always create a new one
- Use foreign key constraints and proper indexes

## Do Not
- Do not modify `.env` or commit secrets
- Do not run `migrate:fresh` on anything except local
- Do not install new packages without asking first

## Understanding My Requests

English is not my first language and I'm still learning to write good prompts.
My messages may have grammar mistakes, unclear words, or missing details.

Before starting any task (except very small ones like a typo fix):

1. Rewrite my message as a clear, well-written prompt
2. Tell me in 1–3 lines what you understood I want
3. If anything is unclear or missing, ask me (max 3 questions)
4. Wait for my "yes" or correction before writing code

Use this format:

    **Your prompt (cleaned up):**
    > [my request rewritten clearly and correctly]

    **What I understood:**
    [short summary of what you will do]

    **Questions (if any):**
    [only if something is really unclear]

    Shall I proceed?

### Prompt log
After I confirm, append an entry to `docs/prompt-log.md`:

    ## [date] — [short title]
    **What I wrote:**
    > [my original message, exactly as I wrote it]

    **Clear version:**
    > [the cleaned-up prompt]

    **What I meant:**
    [one line]

    **Tip:**
    [one short tip to write this kind of prompt better next time]

Do not fix or rewrite my original message in the log. Keep it exactly
as I wrote it so I can compare.

## Naming Exceptions (Legacy Mistakes)

Some names in this project don't match what the code actually does.
They come from an earlier mistake. Always use this table to understand them.

| Name in code         | What it actually is                 |
|----------------------|-------------------------------------|
| `PurchaseController` | Purchase Invoice / Receipt          |
| `PurchaseOrderController` (views `purchase_orders/`, routes `purchase-order.*`) | Purchase Receipt / Invoice (saves `type = 'receipt'`, prefix `PR`) |

Rules:
- When I say "receipt" or "purchase invoice", I mean `PurchaseController`
  and its related files
- Do NOT rename these files, classes, routes, or tables unless I ask
- When creating new code, use the correct names, not the legacy ones

### If you find a new mismatch
If you find names that don't match each other, for example:
- a controller and its views have different names
- a model name doesn't match its table or what it does
- a route name doesn't match its controller
- a file name doesn't match what the code inside actually does

Then:
1. STOP and ask me before doing anything with it
2. Tell me what you found, e.g. "`OrderController` uses views from
   `views/sales/`. Is this intentional?"
3. Do NOT guess what it means, and do NOT fix or rename it yourself
4. After I explain, add a new row to the table above with my answer
