# CLAUDE.md — gitops-gke-platform

This file is the reference guide for Claude Code when working on this project.
Read this before doing anything else in this repo, every session.

---

## WHY THIS PROJECT EXISTS (read this first)

There is an earlier, finished version of this idea at
`C:\Users\bebo_\Desktop\gitops-argocd-platform` — a working ArgoCD + GitOps + Kustomize
platform on a local `kind` cluster, Phase 1 mostly complete and verified. That project got
built successfully, but the person building it lost track of *why* things worked and couldn't
explain it back — the pace was too fast and too much got built per session relative to how much
actually got absorbed.

**This is a deliberate restart, not a continuation.** Do not copy code or manifests from the old
project. It's fine to glance at it later as a "does my version look reasonable" sanity check
once something is independently built and understood here — but the point of starting over is to
arrive at each piece of YAML/config through understanding, not to transplant a working answer.

This time: **real GCP + GKE from day one**, no local `kind` cluster as an intermediate step —
learn cloud concepts as they come up rather than deferring them to a later "parallel project."

---

## THE ONE RULE THAT MATTERS MOST

**Go one concept at a time. Do not proceed until the person has confirmed they actually
understand the current concept — not just that a command succeeded.**

Concretely:
- Explain a concept in plain language *before* writing any file or running any command that
  depends on it.
- After explaining, stop and ask something that checks understanding (not just "make sense?") —
  e.g. ask them to predict what a command will do before running it, or explain a piece back in
  their own words.
- Do not bundle multiple new concepts into one step. If a step naturally involves two new ideas
  (e.g. "install ArgoCD" touches both Helm *and* the Application CRD), split it into two
  check-ins.
- It is completely fine for a session to end after covering very little — that is success, not
  slowness, for this project. Do not rush to "finish a phase" in one sitting.
- If something breaks, treat it as a teaching moment: explain what the error means before fixing
  it, not just apply the fix.
- Never generate a whole phase or a whole set of files at once "to save time." That's exactly
  the failure mode that caused the restart.
- At the start of every session, briefly recap where things left off and re-confirm the person
  still remembers/understands the last concept covered before moving forward. If they don't,
  re-explain it — don't just plow ahead because it was covered before.

---

## WHO I AM

- Transitioning from Technical Support Engineer into DevOps / cloud engineering.
- Comfortable with: Python, Docker, Kubernetes basics, GitHub Actions, Terraform, GCP (has a
  separate finished project, `gcp-gke-pipeline`, covering CI on GCP with Terraform-provisioned
  GKE — can be referenced for how Terraform/GCP pieces were done before, same caveat as above:
  reference for sanity-checking, not a source to copy from blind).
- Newer to: ArgoCD, Kustomize, GitOps patterns, sealed-secrets, App-of-Apps pattern, and doing
  any of this against a *real* cloud cluster rather than a local one.
- Wants real war-story-worthy debugging moments flagged and documented, same as before — but
  only after actually understanding what broke, not as a substitute for understanding it.

---

## WHAT WE ARE BUILDING (high level, subject to refinement together)

Likely similar shape to the old project — one or two small self-written services, deployed via
ArgoCD + Kustomize across environments — but running on **real GKE**, with the cluster itself
provisioned via **Terraform**, and GitOps wired in from the start rather than bolted on later.

Exact scope (which services, how many environments, Terraform layout, etc.) has **not been
decided yet** — that's a first-session conversation, not something to assume from the old
project's shape. Ask before scaffolding anything.

---

## HANDOVER STATUS

**Status:** Not started. This file is the only thing that exists in this repo so far.

**Next step on resume:** first session — introduce GCP/GKE/Terraform/ArgoCD/GitOps at a high
level (the "why," not the "how" yet), confirm the person's actual goal for this project (what
should it demonstrate, same as the old README's opening question), and agree on the two or three
things to build before writing any code or provisioning anything in GCP.

---

## GROUND RULES

- Follow "THE ONE RULE THAT MATTERS MOST" above, always.
- Ask before making architectural decisions when there's more than one reasonable approach.
- Ask before provisioning anything in real GCP that costs money or is hard to reverse — narrate
  what a command will create/charge before running it.
- Keep all manifests and code readable and commented, same standard as the old project.
- Document war stories when something breaks, in the same format the old project used (what
  happened / what was tried first / root cause / fix / what it taught) — once available, this
  file's format can point to a `teaching/` folder like the old project did.
