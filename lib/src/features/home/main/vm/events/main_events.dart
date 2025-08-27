sealed class MainEvents {}

final class ChangeTabEvent extends MainEvents {
  final int index;

  ChangeTabEvent(this.index);
}
