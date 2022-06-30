CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint Not NULL,
  "currency" varchar Not NULL,
  "created_at" timestamptz Not NULL DEFAULT (now())
);

CREATE TABLE "enrtries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint Not NULL,
  "amount" bigint Not NULL,
  "created_at" timestamptz Not NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint Not NULL,
  "to_account_id" bigint Not NULL,
  "amount" bigint Not NULL,
  "created_at" timestamptz Not NULL DEFAULT (now())
);

ALTER TABLE "enrtries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "enrtries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "enrtries"."amount" IS 'can be negative or positive';

COMMENT ON COLUMN "transfers"."amount" IS 'must be positive';
