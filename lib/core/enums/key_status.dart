enum KeyStatus {
  initial,
  active,
  inactive;

  bool get isInitial => this == KeyStatus.initial;

  bool get isActive => this == KeyStatus.active;

  bool get isInactive => this == KeyStatus.inactive;
}
