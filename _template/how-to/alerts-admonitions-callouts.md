# Examples of using Alerts, Admonitions, or Callouts

## Alert Examples

### Note

> [!NOTE]  
> Highlights information that users should take into account, even when skimming.

### Tip

> [!TIP]
> Optional information to help a user be more successful.

### Important

> [!IMPORTANT]  
> Crucial information necessary for users to succeed.

### Warning

> [!WARNING]  
> Critical content demanding immediate user attention due to potential risks.

### Caution

> [!CAUTION]
> Negative potential consequences of an action.

### Embedded Code-block

> [!TIP]
> Some useful Javascript:
>
> ```js
> function foo() {
>   return 'bar';  
> }
> ```

### Callout With Custom Title

> [!IMPORTANT] Pay Attention!
> Crucial information necessary for users to succeed.

## Syntax Incompatible With GitHub

### Nested Alerts

While Obsidian supports rendering nested callouts, at the time of writing GitHub does not:

> [!NOTE]  
> Highlights information that users should take into account, even when skimming.
> > [!TIP]
> > Optional information to help a user be more successful.
> > > [!IMPORTANT]  
> > > Crucial information necessary for users to succeed.
> > > > [!WARNING]  
> > > > Critical content demanding immediate user attention due to potential risks.
> > > > > [!CAUTION]
> > > > > Negative potential consequences of an action.

## Resources

- <https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts>
- <https://help.obsidian.md/callouts>
