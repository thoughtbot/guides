# Guide To Writing Guideline Pages

## What are guideline pages?

Guideline pages are comprised of the set of pages linked to from the outline-mode pages and which provide additional information and reasoning behind a guideline. The outline-mode pages are those pages which collate lists of guidelines under a specific topic.

A guideline page is a brief synopsis of a convention, standard, heuristic, best practice, or stylistic choice. It may cover the intent, influences, motivation, applicability, consequences, implementation or other particulars behind a guideline. It is not meant to be a comprehensive analysis; rather it should highlight of the most relevant details.

## Why promote a consistent format?

This *guide to writing guideline pages* suggests an informal simple formatted structure. The aim is to promote a small amount of consistency through format and layout while still being oriented towards flexibility. The content can be conversational and expresive through freeform text, while being presented in a familiar way. This consisitency can aid readers in their efforts to navigate the site because they can anticipate what they expect to find on any given page. When presented with information in a nonconventional or atypical way, they'll have to spend more time figuring out what they are looking at.

The selected structure is influenced by the pattern forms explored and discussed across various wikis such as WikiWikiWeb and resources such as the *Design Patterns* book by the Gang of Four. The format is largely borrowed from the Portland Form, also known as "Therefore But" due to it's construction: You summarize the context and forces in play, and then connect that with a bold "therefore" to the guideline. You can then optionally follow that with any constrasting details.

> [!TIP]
> The guidelines are not formal design patterns, rather they are helpful principles and concepts that are not always well defined. With that in mind, feel free to take liberties with the suggested format. Furthermore, not every guideline requires further explanation.

## Guidelines

- The **file name** should match the **title** of the page exactly
  - as a result, titles must only use characters that are valid for use in a file name
- The **title** should be a *proposition* (or claim) which concisely states the guideline
  - Titles should not be in interrogative form (such a question)
  - Titles should not be in lexical form (such as a noun or noun phrase)
- **Guideline Section**
  - Prefer a **guideline section** that is short and concise but not terse
  - The first part of this section sets the stage by introducing the problem, context, and forces in play
  - The conflict is resolved by presenting the solution or guideline along with a discussion of the resulting context.
  - Then other considerations or counterindications can be reviewed.
  - It then ends with a summary and discussion of the greater context (to connect back to the broader scope).
- Additional **headings** and sections can be added between the `## Guideline` and `## References` sections
  - Prefer repeating patterns found in other guides, but there's no conventions set here yet.
- A **reference** section includes links to resources and pull-requests

## Page Template

```markdown
# Use a prepositional pharse in sentence case for titles

## Guideline

An opening statement and introductory paragraph which discusses the forces in play around a problem. You might state and describe the problem while also quickly summarizing the surrounding context and why the problem exists. 

**Therefore,** present an action to take or a guideline to follow. State the Thesis. Describe the solution and the resulting context. How are the earlier forces resolved? What is the rationale? You might include examples.

(*But...*) An optional section presenting other considerations or contrasting view. You might cover any counterindications to following the guidelines. Describe the position of the antithesis and opposition to the guideline. What happens if you take the guideline too far?

Finally (when relevant) summarize and discuss the greater context. How else can this help. What else is the guideline related to? This might also be a place to connect the guideline to guiding principles or other pages in the guides.

## Optional Additional Sections

Additional freeform sections can be added below the guideline pattern

## References

- [A list of links to supporting evidence, references, articles, or pull-requests](https://example.com)
```

## Propositional Titles

A **proposition** is a statement or assertion that expresses a judgement or opinion[^1].

A propositional title:

- should make an assertion, claim, or declaration
- written in *imperative mood* to express an action, command, suggestion, request, or instruction
- can be a sentence or independent clause
- should present a concise summary of the guideline

## Invalid or Problematic Characters for File Names and Titles

Avoid using characters that would be invalid or problematic in a file name.

| Character | Description          | Why it is problematic                                 |
| --------: | :------------------- | ----------------------------------------------------- |
| `/`       | forward slash        | used as a path name component separator               |
| `\`       | backslash            | used as a path name component separator               |
| `?`       | question mark        | used as a wildcard                                    |
| `*`       | asterisk             | used as a wildcard                                    |
| `%`       | percent              | used as a wildcard                                    |
| `<`       | less than            | redirects output                                      |
| `>`       | greater than         | redirects input                                       |
| `:`       | colon                | Windows uses this for mount point / drives            |
| `"`       | double quote         | legacy restriction carried over from DOS              |
| `\|`      | vertical bar or pipe | used for software pipelining                          |
| `.`       | period               | last occurrence is interpreted as extension separator |
| `=`       | equal sign           | somecommand line interpreters use this as a separator |

## References

- Pattern Forms
  - <https://wiki.c2.com/?PortlandForm>
  - <https://wiki.c2.com/?ThereforeBut>
  - <https://wiki.c2.com/?PatternForms>
  - <https://c2.com/ppr/about/portland.html>
- Invalid Filename Characters
  - <https://stackoverflow.com/questions/1976007/what-characters-are-forbidden-in-windows-and-linux-directory-names#:~:text=Sorted%20by:,Non%2Dprintable%20characters>
  - <https://en.wikipedia.org/wiki/Filename#Problematic_characters>

[^1]: Definition from [Oxford Languages](https://languages.oup.com/google-dictionary-en/) via Google Search
