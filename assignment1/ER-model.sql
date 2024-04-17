CREATE TABLE "boards" (
  "id" integer PRIMARY KEY,
  "creator_user_id" integer,
  "name" string NOT NULL,
  "description" text,
  "color" varchar,
  "is_public" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "states" (
  "id" integer PRIMARY KEY,
  "board_id" integer,
  "name" varchar NOT NULL,
  "position" integer NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "tasks" (
  "id" integer PRIMARY KEY,
  "state_id" integer,
  "informer_user_id" integer,
  "name" varchar NOT NULL,
  "priority" integer NOT NULL,
  "description" text,
  "status" string,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" text NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "workspaces" (
  "id" integer PRIMARY KEY,
  "creator_user_id" integer,
  "name" string NOT NULL,
  "type" string NOT NULL,
  "description" text,
  "is_public" integer NOT NULL
);

CREATE TABLE "task_commments" (
  "id" integer PRIMARY KEY,
  "creator_user_id" integer,
  "task_id" integer,
  "body" text NOT NULL,
  "task_attachment_id" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "labels" (
  "id" integer PRIMARY KEY,
  "creator_user_id" integer,
  "board_id" integer,
  "name" varchar NOT NULL,
  "color" varchar NOT NULL
);

CREATE TABLE "task_labels" (
  "id" integer PRIMARY KEY,
  "task_id" integer
);

CREATE TABLE "comments_attachment" (
  "id" integer PRIMARY KEY,
  "filename" varchar,
  "url_link" varchar
);

CREATE TABLE "user_board" (
  "user_id" integer,
  "board_id" integer,
  PRIMARY KEY ("user_id", "board_id")
);

CREATE TABLE "user_task" (
  "user_id" integer,
  "task_id" integer,
  PRIMARY KEY ("user_id", "task_id")
);

CREATE TABLE "user_workspace" (
  "user_id" integer,
  "workspace_id" integer,
  PRIMARY KEY ("user_id", "workspace_id")
);

COMMENT ON COLUMN "tasks"."priority" IS 'High/Medium/Low';

COMMENT ON COLUMN "workspaces"."is_public" IS '1 or 0';

ALTER TABLE "boards" ADD FOREIGN KEY ("creator_user_id") REFERENCES "users" ("id");

ALTER TABLE "states" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "tasks" ADD FOREIGN KEY ("state_id") REFERENCES "states" ("id");

ALTER TABLE "tasks" ADD FOREIGN KEY ("informer_user_id") REFERENCES "users" ("id");

ALTER TABLE "workspaces" ADD FOREIGN KEY ("creator_user_id") REFERENCES "users" ("id");

ALTER TABLE "task_commments" ADD FOREIGN KEY ("creator_user_id") REFERENCES "users" ("id");

ALTER TABLE "task_commments" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id");

ALTER TABLE "task_commments" ADD FOREIGN KEY ("task_attachment_id") REFERENCES "comments_attachment" ("id");

ALTER TABLE "labels" ADD FOREIGN KEY ("creator_user_id") REFERENCES "users" ("id");

ALTER TABLE "labels" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "task_labels" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id");

ALTER TABLE "user_board" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_board" ADD FOREIGN KEY ("board_id") REFERENCES "boards" ("id");

ALTER TABLE "user_task" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_task" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id");

ALTER TABLE "user_workspace" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_workspace" ADD FOREIGN KEY ("workspace_id") REFERENCES "workspaces" ("id");
