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

## WHAT WE ARE BUILDING

Decided and built (see `teaching/09-what-we-are-deploying.md` for the decision, `teaching/00-...`
for the full sequence): one small self-written Flask app, containerized and pushed to Google
Artifact Registry, deployed via ArgoCD + Kustomize across two environments (`dev`, `prod`) on a
**real GKE Autopilot cluster** provisioned via **Terraform**, with GitOps wired in from the
start. Scope for anything beyond this (a second service, staging environment, sealed-secrets,
CI) is still open — ask before scaffolding any of that.

---

## HANDOVER STATUS

**Live, authoritative status lives in `teaching/00-overview-and-working-agreement.md`** — read
that file first when resuming, specifically its "Sequence so far" and "Resume point" sections.
This section here is a snapshot, not the source of truth; it will go stale, that file won't
(per the hard rule inside it about updating every step).

**As of 2026-07-29:** core roadmap is complete and verified end-to-end — real GCP project,
Terraform-provisioned GKE Autopilot cluster, a containerized Flask app in Google Artifact
Registry, and ArgoCD managing two isolated environments (`dev`/`prod`) purely from git, with a
real promotion visibly provable via the app's own `/api/info` endpoint. Remaining work
(sealed-secrets, CI, App of Apps) is optional polish, not core scope — see `teaching/00-...` for
details and the current pause/resume state.

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
