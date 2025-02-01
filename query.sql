DELETE FROM public.execution_data
WHERE "executionId" IN (
    SELECT id FROM public.execution_entity 
    WHERE status IN ('error', 'crashed')
);

DELETE FROM public.execution_entity
WHERE status IN ('error', 'crashed');
