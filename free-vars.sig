sig free-vars.

kind tm type.
type z tm.
type s tm -> tm.

kind fm type.
type eq, ad tm -> tm -> fm.
type imp fm -> fm -> fm.
type all ( tm -> fm ) -> fm.

kind lst type.
type emty lst.
type cons tm -> lst -> lst.

type app lst -> lst -> lst -> o.
type mem tm -> lst -> o.

type bind tm -> o.

type fv_fm fm -> lst -> lst -> o.
type fv_tm tm -> lst -> lst -> o.
type free_in_fm tm -> fm -> o.
type free_in_tm tm -> tm -> o.
