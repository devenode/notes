## Стандарт css
```
:root {
    /* texts */
    --text-color-main: #191F36;
    --text-color-sub: #A5ADBB;
    --text-color-link: #0B6AFF;
    --text-color-link-hover: #1067f1;
    --text-color-link-active: #0d62eb;
    --text-size-1: 1.4rem;
    --text-size-2: .85rem;
    --text-size-3: .75rem;
    --text-size-4: .70rem;
    --text-weight-1: 700;
    --text-weight-2: 600;
    --text-weight-3: 500;

    /* button */
    --button-border-radius-1: 4px;
    --button-border-radius-2: 6px;
    --button-color-blue: #0B6AFF;
    --button-color-blue-hover: #1067f1;
    --button-color-blue-active: #0d62eb;
    --button-color-grey: #E8E8E8;
    --button-color-grey-hover: #e0e0e0;
    --button-color-grey-active: #d6d5d5;
    --button-shadow-color-blue: #E1EFFF;
    --button-shadow-color-grey: #E0E0E0;
    --button-blue-text-color: #FFFFFF;
    --button-grey-text-color: #989898;
    --button-shadow-spread-active: 3px;

    /* input */
    --input-border-radius: 5px;
    --input-border-color: #E2E2E2;
    --input-border-color-active: #BCD5F3;
    --input-shadow-color: #EFEFEF;
    --input-shadow-color-active: #E1EFFF;
    --input-shadow-spread: 2px;
    --input-shadow-spread-active: 3px;
    --input-background-color-disabled: #FAFBFB;

    /* layouts */
    --main-layout-width: 590px;
}

* {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}

body {
    font-size: var(--text-size-2);
    color: var(--text-color-main);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-tap-highlight-color: transparent;
    overflow-y: scroll;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    display: none
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="number"],
select,
textarea {
    font-family: inherit;
    appearance: none;
    font-size: var(--text-size-2);
    color: var(--text-color-main);
    outline: none;
    width: 100%;
    transition: box-shadow .2s ease;
    border: 1px solid var(--input-border-color);
    border-radius: var(--input-border-radius);
    padding: 12px 20px;
    box-shadow: 0 0 0 var(--input-shadow-spread) var(--input-shadow-color);
    -webkit-appearance: none;
    -moz-appearance: none;
}

input::placeholder {
    font-family: inherit;
    font-size: var(--text-size-2);
    color: var(--text-color-sub);
}

input:focus,
select:focus,
textarea:focus {
    outline: none;
    border: 1px solid var(--input-border-color-active);
    box-shadow: 0 0 0 var(--input-shadow-spread-active) var(--input-shadow-color-active);
}

input:disabled,
input:read-only {
    background: var(--input-background-color-disabled);
    color: var(--text-color-sub);
}

img {
    display: block;
}

ul {
    list-style: none
}

textarea {
    display: block;
    resize: none;
    height: 280px;
    box-sizing: border-box;
    margin: 0;
}

textarea::-webkit-input-placeholder,
textarea::-moz-placeholder,
textarea:-ms-input-placeholder,
textarea::placeholder {
    font-family: inherit;
    font-size: var(--text-size-2);
    color: var(--text-color-sub);
}

button {
    font-family: inherit;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: var(--text-size-2);
    color: var(--button-blue-text-color);
    font-weight: var(--text-weight-1);
    outline: none;
    cursor: pointer;
    background-color: var(--button-color-blue);
    transition: box-shadow .2s ease;
    width: 100%;
    height: 40px;
    border: none;
    border-radius: var(--button-border-radius-1);
}

button:focus {
    box-shadow: 0 0 0 var(--button-shadow-spread-active) var(--button-shadow-color-blue);
    background-color: var(--button-color-blue-active);
}

a {
    color: var(--text-color-link);
    outline: none;
    text-decoration: none;
}

a:hover {
    color: var(--text-color-link-hover);
}

h1 {
    font-size: var(--text-size-1);
}

.noselect {
    user-select: none;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}

.ellipsis {
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.hrzScroll {
    overflow-x: scroll;
    -webkit-overflow-scrolling: touch;
}

.hrzScroll::-webkit-scrollbar {
    display: none;
}

.hideScrollbar {
    -ms-overflow-style: none;
    scrollbar-width: none;
}

.layout {
    margin: 0 auto;
    width: 100%;
    padding: 0 15px;
    max-width: var(--main-layout-width);
}
```
