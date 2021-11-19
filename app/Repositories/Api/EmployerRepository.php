<?php

namespace App\Repositories\Api;

use App\Exceptions\GeneralException;
use App\Models\Auth\User;
use App\Models\Auth\Employer;
use App\Repositories\BaseRepository;

class EmployerRepository extends BaseRepository
{
    /**
     * Associated Repository Model.
     */
    const MODEL = User::class;

    /**
     * Sortable.
     *
     * @var array
     */
    private $sortable = [
        'id',
        'status',
        'created_at',
        'updated_at',
    ];

    /**
     * Retrieve List.
     *
     * @var array
     * @return Collection
     */
    public function retrieveList(array $options = [])
    {
        $perPage = isset($options['per_page']) ? (int) $options['per_page'] : 20;
        $orderBy = isset($options['order_by']) && in_array($options['order_by'], $this->sortable) ? $options['order_by'] : 'created_at';
        $order = isset($options['order']) && in_array($options['order'], ['asc', 'desc']) ? $options['order'] : 'desc';
        $query = $this->query();
        $query = $query->whereHas('role','Employer');
        $query = $query->orderBy($orderBy, $order);

        if ($perPage == -1) {
            return $query->get();
        }

        return $query->paginate($perPage);
    }

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->query()
            ->select([
                'id',
                'status',
                'created_at',
                'updated_at',
            ]);
    }

    /**
     * @param array $input
     *
     * @throws \App\Exceptions\GeneralException
     *
     * @return bool
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        $input['status'] = $input['status'] ?? 0;

        if ($faq = Faq::create($input)) {
            event(new FaqCreated($faq));

            return $faq;
        }

        throw new GeneralException(__('exceptions.backend.faqs.create_error'));
    }

    /**
     * @param \App\Models\Faq $faq
     * @param array $input
     */
    public function update(Faq $faq, array $input)
    {
        $input['updated_by'] = auth()->user()->id;
        $input['status'] = $input['status'] ?? 0;

        if ($faq->update($input)) {
            event(new FaqUpdated($faq));

            return $faq->fresh();
        }

        throw new GeneralException(__('exceptions.backend.faqs.update_error'));
    }

    /**
     * @param \App\Models\Faq $faq
     *
     * @throws GeneralException
     *
     * @return bool
     */
    public function delete(Faq $faq)
    {
        if ($faq->delete()) {
            event(new FaqDeleted($faq));

            return true;
        }

        throw new GeneralException(__('exceptions.backend.faqs.delete_error'));
    }
}
