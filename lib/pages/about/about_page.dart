Widget buildAuthor(BuildContext context) {
    return ListTile(
      leading: const Text(""),
      title: Text(AppLocalizations.of(context).aboutAuthorTitle),
      subtitle: const Text("KilluaZoldich\nBased on original work by Alberto Pedron"),
    );
  }