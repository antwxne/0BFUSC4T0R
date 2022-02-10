# 0BFUSC4T0R

## Description

Simple ruby script to obfuscate C files.

It replaces compatible characters by digraphs/trigraphs

### Digraphs

|character|replacement|
|:-:|:-:|
|`[`|`<:`|
|`]`|`:>`|
|`{`|`<%`|
|`}`|`%>`|
|`#`|`%:`|

### Trigraphs

|character|replacement|
|:-:|:-:|
|`[`|`??(`|
|`]`|`??)`|
|`{`|`??<`|
|`}`|`??>`|
|`#`|`??=`|
|`\`|`??/`|
|`^`|`??'`|
|`~`|`??-`|

## Usage

```shell
ruby obfuscator.rb < flag > < input file > < output file >
```

Flags:

- `-d` to use digraphs
- `-t` to use trigraphs

> Warning: if you use trigraphs, you'll need to compile with `-trigraphs`

## Exemples

input file:

```c
#include <stdio.h>
#include <string.h>

int main(void)
{
    char str[100] = {0};

    strcpy(str, "Hello world!");
    puts(str);
    return 0;
}
```

Outputfiles:

- Digraph:

    ```c
    %:include <stdio.h>
    %:include <string.h>

    int main(void)
    <%
        char str<:100:> = <%0%>;

        strcpy(str, "Hello world!");
        puts(str);
        return 0;
    %>
    ```

- Trigraphs:

    ```c
    ??=include <stdio.h>
    ??=include <string.h>

    int main(void)
    ??<
        char str??(100??) = ??<0??>;

        strcpy(str, "Hello world!");
        puts(str);
        return 0;
    ??>
    ```
