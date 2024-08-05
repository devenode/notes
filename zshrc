Open Terminal: You can find it in the Applications folder or search for it using Spotlight (Command + Space).

Edit bash profile: Use the command nano ~/.bash_profile or nano ~/.zshrc (for newer MacOS versions) to open the profile file in a text editor.

Add Environment Variable: In the editor, ensure you have set your API key as shown below, replacing your-api-key-here with your actual API key:

export OPENAI_API_KEY='your-api-key-here'
Save and exit: Press Ctrl+O to write the changes, followed by Ctrl+X to close the editor.

Load your profile: Use the command source ~/.bash_profile or source ~/.zshrc to load the updated profile.

Verification: Verify the setup by typing echo $OPENAI_API_KEY in the terminal. It should display your API key.
