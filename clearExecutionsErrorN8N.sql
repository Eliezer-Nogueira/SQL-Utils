-- Deleta os dados relacionados às execuções com erro/crash e startedAt nulo
DELETE FROM public.execution_data
WHERE "executionId" IN (
    SELECT id FROM public.execution_entity 
    WHERE status IN ('error', 'crashed')
      AND "startedAt" IS NULL
);

-- Depois de apagar os dados relacionados, deleta as execuções em si
DELETE FROM public.execution_entity
WHERE status IN ('error', 'crashed')
  AND "startedAt" IS NULL;
